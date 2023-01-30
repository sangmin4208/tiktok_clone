import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});
  static const _interests = [
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
  ];

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final _scrollController = ScrollController();
  bool _showTitle = false;

  final GlobalKey _showTitleTargetKey = GlobalKey();
  final GlobalKey _appBarKey = GlobalKey();
  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      /// This is the key to the solution
      final RenderBox renderBox =
          _showTitleTargetKey.currentContext!.findRenderObject()! as RenderBox;
      final targetPosition = renderBox.localToGlobal(Offset.zero);
      final appBarSize =
          (_appBarKey.currentContext!.findRenderObject()! as RenderBox)
              .size
              .height;
      final position = targetPosition.dy - appBarSize;

      if (position < 0) {
        _showTitle = true;
      } else {
        _showTitle = false;
      }
      setState(() {});
    });
  }

  _onSkipTap() {}
  _onNextTap() {}

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: const Text('Choose Your interests'),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v28,
                const Text(
                  'Get better video recommendations ',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  key: _showTitleTargetKey,
                ),
                Gaps.v64,
                Wrap(
                  spacing: Sizes.size16,
                  runSpacing: Sizes.size16,
                  children: [
                    for (var interest in InterestsScreen._interests)
                      InterestButton(interest: interest),
                  ],
                ),
                Gaps.v40,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size24,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size24,
                    vertical: Sizes.size12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _onSkipTap();
                    },
                    child: const Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.h16,
              Expanded(
                  child: GestureDetector(
                onTap: _onNextTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size24,
                    vertical: Sizes.size12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
