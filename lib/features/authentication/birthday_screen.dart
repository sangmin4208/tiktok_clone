import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_text_field.dart';
import 'package:tiktok_clone/features/authentication/widgets/widgets.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthDayScreen extends StatefulWidget {
  const BirthDayScreen({super.key});

  @override
  State<BirthDayScreen> createState() => _BirthDayScreenState();
}

class _BirthDayScreenState extends State<BirthDayScreen> {
  final TextEditingController _birthDayController = TextEditingController();

  final DateTime _initialDate = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _setTextFieldValue(_initialDate);
  }

  @override
  void dispose() {
    _birthDayController.dispose();
    super.dispose();
  }

  void _setTextFieldValue(DateTime value) {
    _birthDayController.text = value.formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'When is your birthday?',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              'This won\'t be part of your public profile.',
              style: TextStyle(
                fontSize: Sizes.size14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gaps.v16,
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return CupertinoDatePicker(
                        initialDateTime: _initialDate,
                        mode: CupertinoDatePickerMode.date,
                        maximumDate: _initialDate,
                        onDateTimeChanged: _setTextFieldValue,
                      );
                    });
              },
              child: AuthTextField(
                controller: _birthDayController,
                enabled: false,
              ),
            ),
            Gaps.v32,
            FormButton(
              isValid: true,
              onTap: _onNextTap,
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: _initialDate,
                mode: CupertinoDatePickerMode.date,
                maximumDate: _initialDate,
                onDateTimeChanged: _setTextFieldValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on DateTime {
  String get formattedDate => '$year-$month-$day';
}
