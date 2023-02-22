import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.videoUrl,
  });

  final VoidCallback onVideoFinished;
  final String videoUrl;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayerController;
  late final AnimationController _animationController;

  bool _isPaused = false;
  Duration get _animationDuration => const Duration(milliseconds: 250);

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
    );
  }

  void _initVideoPlayerController() async {
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        widget.onVideoFinished();
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayerController();
    _initAnimationController();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) async {
    final isInitialized = _videoPlayerController.value.isInitialized;
    final isFullyVisible = info.visibleFraction == 1;
    final isPlaying = _videoPlayerController.value.isPlaying;

    if (isInitialized && isFullyVisible && !isPlaying && !_isPaused) {
      await _videoPlayerController.play();
    }
  }

  void _onTogglePlay() async {
    if (!_videoPlayerController.value.isInitialized) {
      return;
    }
    if (_videoPlayerController.value.isPlaying) {
      await _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      await _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentsTap() async {
    final isPlaying = _videoPlayerController.value.isPlaying;
    if (isPlaying) {
      _onTogglePlay();
    }

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const VideoComments();
      },
    );
    if (isPlaying) {
      _onTogglePlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoUrl),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController, key: widget.key),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePlay,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "@나쵸",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  'This is my house in Thailand!!!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/16849874?v=4'),
                  child: Text('나쵸'),
                ),
                Gaps.v32,
                const VideoButton(
                    icon: FontAwesomeIcons.solidHeart, text: '1.2M'),
                Gaps.v12,
                GestureDetector(
                  onTap: () {
                    _onCommentsTap();
                  },
                  child: const VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: '33K',
                  ),
                ),
                Gaps.v12,
                const VideoButton(icon: FontAwesomeIcons.share, text: 'Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
