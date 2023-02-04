import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/sizes.dart';
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

class _VideoPostState extends State<VideoPost> with TickerProviderStateMixin {
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
    _animationController.addListener(() => setState(() {}));
  }

  void _initVideoPlayerController() async {
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    await _videoPlayerController.initialize();
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
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) async {
    final isInitialized = _videoPlayerController.value.isInitialized;
    final isFullyVisible = info.visibleFraction == 1;
    final isPlaying = _videoPlayerController.value.isPlaying;
    if (isInitialized && isFullyVisible && !isPlaying) {
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
                child: Transform.scale(
                  scale: _animationController.value,
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
        ],
      ),
    );
  }
}
