import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/stf_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final screens = [
    // const Center(
    //   child: Text('Home'),
    // ),
    // const Center(
    //   child: Text('Discover'),
    // ),
    // const Center(
    //   child: Text('Create'),
    // ),
    // const Center(
    //   child: Text('Inbox'),
    // ),
    // const Center(
    //   child: Text('Profile'),
    // ),
    const StfScreen(
      key: Key('home'),
      title: 'Home',
    ),
    const StfScreen(
      key: Key('Home'),
      title: 'Discover',
    ),
    const StfScreen(
      key: Key('Create'),
      title: 'Create',
    ),
    const StfScreen(
      key: Key('Inbox'),
      title: 'Inbox',
    ),
    const StfScreen(
      key: Key('Profile'),
      title: 'Profile',
    ),
  ];

  int _selectedIndex = 0;

  _onNavTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Post Video'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: screens[0],
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: screens[1],
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: screens[2],
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: screens[3],
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: screens[4],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                label: 'Home',
                isSelected: _selectedIndex == 0,
                onTab: () => _onNavTab(0),
              ),
              NavTab(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                label: 'Discover',
                isSelected: _selectedIndex == 1,
                onTab: () => _onNavTab(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                label: 'Inbox',
                isSelected: _selectedIndex == 3,
                onTab: () => _onNavTab(3),
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                label: 'Profile',
                isSelected: _selectedIndex == 4,
                onTab: () => _onNavTab(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
