import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';

enum Direction { left, right }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _currentPage = Page.first;

  CrossFadeState get _crossFadeState => _currentPage == Page.first
      ? CrossFadeState.showFirst
      : CrossFadeState.showSecond;

  double get _showNextButton => _currentPage == Page.second ? 1 : 0;

  Duration get _opacityDuration => const Duration(milliseconds: 500);

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      _direction = Direction.right;
    } else {
      _direction = Direction.left;
    }
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.right) {
      _currentPage = Page.first;
    } else {
      _currentPage = Page.second;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const _TutorialFirstPage(),
              secondChild: const _TutorialSecondPage(),
              crossFadeState: _crossFadeState,
              duration: _opacityDuration,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size16,
            ),
            child: AnimatedOpacity(
              opacity: _showNextButton,
              duration: _opacityDuration,
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: const Text('Enter the app!'),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TutorialSecondPage extends StatelessWidget {
  const _TutorialSecondPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Gaps.v80,
        Text(
          'Follow the rules',
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          "Take care of one another and follow the rules. We're all in this together.",
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _TutorialFirstPage extends StatelessWidget {
  const _TutorialFirstPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Gaps.v80,
        Text(
          'Watch cool videos!',
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          "Videos are personalized for you based on what you watch, like, and share.",
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
