import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('3'),
    ),
    const Center(
      child: Text('4'),
    ),
    const Center(
      child: Text('5'),
    ),
  ];

  int _selectedIndex = 0;

  _onNavTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
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
                icon: FontAwesomeIcons.magnifyingGlass,
                label: 'Discover',
                isSelected: _selectedIndex == 1,
                onTab: () => _onNavTab(1),
              ),
              NavTab(
                icon: FontAwesomeIcons.message,
                label: 'Inbox',
                isSelected: _selectedIndex == 3,
                onTab: () => _onNavTab(3),
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
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
