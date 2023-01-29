import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_text_form_field.dart';
import 'package:tiktok_clone/features/authentication/widgets/widgets.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const InterestsScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              AuthTextFormField(
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['email'] = value!;
                },
              ),
              Gaps.v28,
              AuthTextFormField(
                obscureText: true,
                labelText: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['password'] = value!;
                },
              ),
              Gaps.v28,
              FormButton(
                isValid: true,
                onTap: _onSubmitTap,
                label: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
