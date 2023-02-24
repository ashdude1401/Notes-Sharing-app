import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("OR"),
      const SizedBox(
        height: tFormHeight - 24,
      ),
      SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            googleImg,
            width: 20,
          ),
          label: Text(tGoogleSignIn.toUpperCase()),
        ),
      ),
      const SizedBox(
        height: tFormHeight - 24,
      ),
      TextButton(
        onPressed: () {},
        child: Text.rich(
          TextSpan(
            text: tAlreadyAccount,
            style: Theme.of(context).textTheme.bodyLarge,
            children: const [
              TextSpan(text: loginText, style: TextStyle(color: Colors.blue))
            ],
          ),
        ),
      )
    ]);
  }
}
