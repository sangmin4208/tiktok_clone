import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.indigo,
  ];
  int _itemCount = 10;
  List<Color> get _colors {
    return List.generate(_itemCount, (index) => colors[index % colors.length]);
  }

  void _onPageChanged(int index) {
    if (index == _itemCount - 1) {
      print('Last page');
      _itemCount += 4;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: _onPageChanged,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return Container(
          color: _colors[index],
          child: Center(
            child: Text(
              'Page $index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        );
      },
    );
  }
}
