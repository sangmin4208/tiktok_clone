import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    bool obscureText = false,
    Widget? suffix,
    VoidCallback? onEditingComplete,
    TextInputType? keyboardType,
    String? errorText,
    String? hintText,
    required TextEditingController? controller,
  })  : _obscureText = obscureText,
        _controller = controller,
        _suffix = suffix,
        _onEditingComplete = onEditingComplete,
        _keyboardType = keyboardType,
        _errorText = errorText,
        _hintText = hintText,
        super(key: key);

  final bool _obscureText;

  final TextEditingController? _controller;

  final Widget? _suffix;

  final VoidCallback? _onEditingComplete;

  final TextInputType? _keyboardType;

  final String? _errorText;

  final String? _hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      onEditingComplete: _onEditingComplete,
      keyboardType: _keyboardType,
      autocorrect: false,
      controller: _controller,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        suffix: _suffix,
        errorText: _errorText,
        hintText: _hintText,
        hintStyle: const TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
