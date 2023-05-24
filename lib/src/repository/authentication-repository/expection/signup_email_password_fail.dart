

class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      {this.message = "An Unknown error occured"});

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            message: "Please enter a stronger password");
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            message: "Please enter a stronger password");
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            message: "Please enter a stronger password");
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            message: "Please enter a stronger password");
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            message: "Please enter a stronger password");
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
