import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String firstName;
  final String lastName;
  final String phnNum;

  const User(
      {required this.email,
      required this.uid,
      this.photoUrl =
          'https://firebasestorage.googleapis.com/v0/b/industry-academia-commun-c9d09.appspot.com/o/profileicon.png?alt=media&token=9dbf4e4b-8dce-4769-8693-1251b8666f48',
      required this.firstName,
      required this.lastName,
      required this.phnNum});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot["username"],
      uid: snapshot["uid"],
      photoUrl: snapshot["photoUrl"],
      firstName: snapshot["firstName"],
      lastName: snapshot["lastName"],
      phnNum: snapshot["phnNum"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "photoUrl": photoUrl,
        "firstName": firstName,
        "lastName": lastName,
        "phnNum": phnNum,
      };
}
