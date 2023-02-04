import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  Duration get scrollDuration => const Duration(milliseconds: 250);
  Curve get scrollCurve => Curves.linear;

  List<String> videoAssets = [
    'assets/videos/test_1.mp4',
    'assets/videos/test_2.mp4',
    'assets/videos/test_3.mp4',
  ];
  int _itemCount = 3;
  List<String> get _videoAssets {
    return List.generate(
        _itemCount, (index) => videoAssets[index % videoAssets.length]);
  }

  void _onPageChanged(int index) {
    _pageController.animateToPage(
      index,
      duration: scrollDuration,
      curve: scrollCurve,
    );
    if (index == _itemCount - 1) {
      setState(() {
        _itemCount += _videoAssets.length;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onVideoFinished() {
    // _pageController.nextPage(
    //   duration: scrollDuration,
    //   curve: scrollCurve,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return VideoPost(
          key: ValueKey(index),
          onVideoFinished: _onVideoFinished,
          videoUrl: _videoAssets[index % _videoAssets.length],
        );
      },
    );
  }
}
