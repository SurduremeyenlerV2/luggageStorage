import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  /* GOOGLE SIGN IN */
  Future<User?> googleSignIn() async {
    final credential = await _getCrendetial();
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    var authUser = userCredential.user;
    return authUser;
  }

  Future<OAuthCredential> _getCrendetial() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return credential;
  }

  /*                   */
  Future<User?> signupWithEmailAndPassword(
      {required String email, required String password}) async {
    User? authUser;
    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      authUser = userCredential.user;
    } catch (e) {
      rethrow;
    }
    return authUser;
  }

  Future<User?> checkCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}
