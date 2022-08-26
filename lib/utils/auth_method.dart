import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:avail_itech_hackfest/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
// get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }
  // Signing Up User

  Future<void> signUpUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String phnNum}) async {
    String? errorMessage;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          phnNum.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          firstName: firstName,
          lastName: lastName,
          phnNum: phnNum,
        );
        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
    }
    Fluttertoast.showToast(msg: "Account created successfully!!!");
  }

  // logging in user
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    String? errorMessage;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // logging in user with email and password
        await _auth
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
    }
    Fluttertoast.showToast(msg: "Login Successful");
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
