import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //Sign Up with Email & Password
  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; //If successful, return null
    } on FirebaseAuthException catch (e) {
      //Return readable error message
      switch (e.code) {
        case 'email-already-in-use': //firebase error code
          return 'This email is already registered.';
        case 'invalid-email':
          return 'The email address is invalid.';
        case 'weak-password':
          return 'The password is too weak.';
        default:
          return e.message ?? 'An unknown error occurred.';
      }
    } catch (e) {
      //Catch unexpected errors
      return 'Something went wrong. Please try again.';
    }
  }

  //Log In with Email & Password
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; //Success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No user found with this email.';
        case 'wrong-password':
          return 'Incorrect password.';
        case 'invalid-email':
          return 'Invalid email format.';
        default:
          return e.message ?? 'Login failed. Please try again.';
      }
    } catch (e) {
      return 'Something went wrong. Please try again.';
    }
  }
  //google sign in
  Future<User?> signInWithGoogle() async {
    // Implementation for Google Sign-In
    try {
      // Step 1: Trigger Google Sign-In dialog
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled login

      // Step 2: Get auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Step 3: Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in with Firebase
      final result = await _auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      throw "Google sign-in failed: $e";
    }
  }

  //Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  //Check Current User
  User? get currentUser => _auth.currentUser;
}
