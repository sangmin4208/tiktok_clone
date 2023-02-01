import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTab,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
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
