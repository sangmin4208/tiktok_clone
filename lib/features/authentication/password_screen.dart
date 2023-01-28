import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_text_field.dart';
import 'package:tiktok_clone/features/authentication/widgets/widgets.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordTyping = false;
  bool _isConfirmPasswordTyping = false;
  bool _obscureText = true;

  String get _password => _passwordController.text;

  bool get _isEmpty => _password.isEmpty;

  bool get _isPasswordValid {
    return _isLengthValid &&
        _isUpperCaseValid &&
        _isLowerCaseValid &&
        _isNumberValid &&
        _isSpecialCharacterValid;
  }

  bool get _isConfirmPasswordValid =>
      _password == _confirmPasswordController.text;

  bool get _isLengthValid => _lengthValidation.hasMatch(_password);

  bool get _isUpperCaseValid => _upperCaseValidation.hasMatch(_password);

  bool get _isLowerCaseValid => _lowerCaseValidation.hasMatch(_password);

  bool get _isNumberValid => _numberValidation.hasMatch(_password);

  bool get _isSpecialCharacterValid =>
      _specialCharacterValidation.hasMatch(_password);

  IconData get _obscureIcon =>
      !_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash;

  final _lengthValidation = RegExp(
    r'.{8,}',
  );
  final _upperCaseValidation = RegExp(
    r'[A-Z]',
  );
  final _lowerCaseValidation = RegExp(
    r'[a-z]',
  );
  final _numberValidation = RegExp(
    r'[0-9]',
  );
  final _specialCharacterValidation = RegExp(
    r'[!@#$%^&*(),.?":{}|<>]',
  );
  String? get _passwordErrorText {
    if (!_isPasswordTyping) {
      return null;
    }
    if (_password.isEmpty) {
      return 'Password is required';
    }
    if (!_isPasswordValid) {
      return 'Password is not valid';
    }

    return null;
  }

  String? get _confirmPasswordErrorText {
    if (!_isConfirmPasswordTyping) {
      return null;
    }
    if (_confirmPasswordController.text.isEmpty) {
      return 'Confirm password is required';
    }
    if (!_isConfirmPasswordValid) {
      return 'Password does not match';
    }

    return null;
  }

  bool get _submitEnabled => _isPasswordValid && _isConfirmPasswordValid;

  void _reset() {
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _isPasswordTyping = false;
      _isConfirmPasswordTyping = false;
    });
  }

  void _onXmarkTap() {
    _reset();
  }

  void _onEyeTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_submitEnabled) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const BirthDayScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      if (!_isPasswordTyping && _password.isNotEmpty) {
        _isPasswordTyping = true;
      }

      setState(() {});
    });

    _confirmPasswordController.addListener(() {
      if (!_isConfirmPasswordTyping &&
          _confirmPasswordController.text.isNotEmpty) {
        _isConfirmPasswordTyping = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v8,
              AuthTextField(
                hintText: 'Enter your password',
                controller: _passwordController,
                errorText: _passwordErrorText,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                keyboardType: TextInputType.visiblePassword,
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedOpacity(
                      opacity: _isEmpty ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: _onXmarkTap,
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Gaps.h14,
                          GestureDetector(
                            onTap: _onEyeTap,
                            child: FaIcon(
                              _obscureIcon,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AuthTextField(
                hintText: 'Confirm password',
                controller: _confirmPasswordController,
                errorText: _confirmPasswordErrorText,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                keyboardType: TextInputType.visiblePassword,
              ),
              Gaps.v32,
              FormButton(
                isValid: _submitEnabled,
                onTap: _onSubmit,
              ),
              Gaps.v32,
              const Text(
                'Your password must meet the following requirements:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v12,
              _RequiredPasswordLabel(
                isValid: _isLengthValid,
                label: const Text(
                  'at least 8 characters long.',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Gaps.v12,
              _RequiredPasswordLabel(
                isValid: _isPasswordValid,
                label: const Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'contain at least one ',
                        ),
                        TextSpan(
                          text: 'uppercase letter',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ', ',
                        ),
                        TextSpan(
                          text: 'lowercase letter',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ', ',
                        ),
                        TextSpan(
                          text: 'number',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ', and ',
                        ),
                        TextSpan(
                          text: 'special character',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RequiredPasswordLabel extends StatefulWidget {
  const _RequiredPasswordLabel({
    required this.isValid,
    required this.label,
  });

  final bool isValid;
  final Widget label;

  @override
  State<_RequiredPasswordLabel> createState() => __RequiredPasswordLabelState();
}

class __RequiredPasswordLabelState extends State<_RequiredPasswordLabel>
    with SingleTickerProviderStateMixin {
  final ColorTween _colorTween = ColorTween(
    begin: Colors.grey,
    end: Colors.green,
  );

  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );
    _animation = _colorTween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  didUpdateWidget(_RequiredPasswordLabel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isValid) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.circleCheck,
          color: _animation.value,
        ),
        Gaps.h8,
        widget.label,
      ],
    );
  }
}
