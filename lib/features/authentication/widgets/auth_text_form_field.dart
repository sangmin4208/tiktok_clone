import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    bool obscureText = false,
    required String labelText,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
  })  : _validator = validator,
        _onSaved = onSaved,
        _hintText = labelText,
        _obscureText = obscureText;

  final String _hintText;
  final String? Function(String?) _validator;
  final void Function(String?) _onSaved;
  final bool _obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
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
        hintText: _hintText,
      ),
      validator: _validator,
      onSaved: _onSaved,
    );
  }
}
