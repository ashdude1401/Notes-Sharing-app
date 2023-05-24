import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/constants/colors.dart';

import '../../features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection('User')
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: tOptionalColor.withOpacity(0.1),
            colorText: tAccentColor))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong .Try again later",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: tOptionalColor.withOpacity(0.1),
          colorText: tAccentColor);
      print(error.toString());
    });
  }
}
