import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../Forgot-Password/Forget-Password-Option/forget_password_model.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final modelSize = MediaQuery.of(context).size;
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: tEmail,
              hintText: tEmail,
            ),
          ),
          const SizedBox(
            height: tFormHeight - 14,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye_sharp,
                )),
          ),
          const SizedBox(
            height: tFormHeight - 24,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ForgetPasswordModel.buidBottomSheet(context, modelSize);
              },
              child: const Text(
                tForgotPassword,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: Text(loginText.toUpperCase(),),),
          )
        ],
      ),
    ));
  }
}
