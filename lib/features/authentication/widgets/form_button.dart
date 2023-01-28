import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    required this.isValid,
    this.widthFactor = 1,
    this.onTap,
  }) : super(key: key);

  final bool isValid;
  final double widthFactor;
  final VoidCallback? onTap;

  bool get _isButtonEnabled => isValid && onTap != null;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size4),
          color: _isButtonEnabled
              ? Theme.of(context).primaryColor
              : Colors.grey.shade300,
        ),
        child: Material(
          type: MaterialType.transparency,
          // color: Colors.transparent,
          child: InkWell(
            onTap: _isButtonEnabled ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size16,
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(
                  milliseconds: 300,
                ),
                style: TextStyle(
                  color: _isButtonEnabled ? Colors.white : Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
