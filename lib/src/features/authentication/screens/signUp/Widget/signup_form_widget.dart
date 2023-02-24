import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: tFormHeight - 10,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: tFullName,
            prefixIcon: Icon(Icons.person_outline_outlined),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: tEmail,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: tSecondaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: tPhoneNumber,
            prefixIcon: Icon(Icons.phone_android_outlined),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: tPassword,
            prefixIcon: Icon(Icons.fingerprint_outlined),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              signupText.toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }
}
