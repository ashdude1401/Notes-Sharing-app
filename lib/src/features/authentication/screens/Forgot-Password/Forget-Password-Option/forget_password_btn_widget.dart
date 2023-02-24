import 'package:flutter/material.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

import '../../../../../constants/sizes.dart';

class ForgotPasswordBtnWidget extends StatelessWidget {
  const ForgotPasswordBtnWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size modelSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(tFormHeight - 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: modelSize.height * 0.08,
              color: tSecondaryColor,
            ),
            SizedBox(
              width: modelSize.height * 0.05,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: tPrimaryColor)),
                  Text(subtitle, style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
