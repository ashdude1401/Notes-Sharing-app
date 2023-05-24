import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/features/Core/screen/dashboard/dashboard.dart';
import 'package:notes_sharing_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:notes_sharing_app/src/repository/authentication-repository/expection/signup_email_password_fail.dart';

class AuthenticationRepostory extends GetxController {
  static AuthenticationRepostory get instance => Get.find();

  //variable
  final _auth = FirebaseAuth
      .instance; //firebase auth service having methods like currentUser and userChanges

  late final Rx<User?>
      firebaseUser; //this our user variable which will have all the data about user and as the user can be null that's why it is nullable

  var verificationId = ''.obs;

  @override
  void onReady() {
    //This methode is provided by Getx , which is run whenver we Authrepository is intialised
    // TODO: implement onReady

    firebaseUser = Rx<User?>(_auth
        .currentUser); // intialising the our user with currentUser in firbase if any

    firebaseUser.bindStream(_auth
        .userChanges()); //now , making our user to listen to changes in the User if any , so that accoding we can make UI changes

    ever(firebaseUser,
        _setIntialScreen); //this method is triggered where there is some change in User and calls the _setIntialScreen

    super.onReady();
  }

  _setIntialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> phoneAuthenticatin(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar('Error', 'The provided phone number is not valid ');
        } else {
          Get.snackbar('Error', 'Something went wrong.Try again later');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmaiAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(
              () => const Dashboard(),
            )
          : Get.to(
              () => const WelcomeScreen(),
            );
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase auth exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmaiAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase auth exception - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
