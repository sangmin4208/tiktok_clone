import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required String interest,
  }) : _interest = interest;
  final String _interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;
  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  BoxShadow get _boxShadow {
    return BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 2,
      offset: const Offset(0, 1),
    );
  }

  Color get _buttonColor {
    if (_isSelected) {
      return Colors.red.shade400;
    } else {
      return Colors.white;
    }
  }

  Color get _textColor {
    if (_isSelected) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelected,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(
            Sizes.size16,
          ),
          boxShadow: [_boxShadow],
        ),
        child: Text(
          widget._interest,
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
            color: _textColor,
          ),
        ),
      ),
    );
  }
}
