import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTab,
    IconData? selectedIcon,
    required this.selectedIndex,
  }) : selectedIcon = selectedIcon ?? icon;

  final IconData icon;
  final String label;
  final bool isSelected;
  final IconData selectedIcon;
  final VoidCallback onTab;
  final int selectedIndex;

  IconData get _icon => isSelected ? selectedIcon : icon;
  double get _opacity => isSelected ? 1 : 0.6;
  Duration get _duration => const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: _duration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  _icon,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
