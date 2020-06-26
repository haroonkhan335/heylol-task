import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userRef = Firestore.instance.collection('users');

  login({String email, String password}) async {
    try {
      final firebaseUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("${firebaseUser.user.email}    ${firebaseUser.user.uid}");
      return firebaseUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  signUp(email, password, name, formKey) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      final userData = {
        "Name": name,
        "email": email,
        "password": password,
        "interestSet": true,
        "interestVideos": ["funny"],
        "dateJoined": DateTime.now()
      };

      try {
        var userDocument;
        var authResult = await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((authResult) {
          userDocument =
              _userRef.document(authResult.user.uid).setData(userData);
        });

        return authResult;
        print(userDocument);
      } catch (e) {
        print("ERROR: $e");
      }
    }
  }

  getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser();
      if (currentUser == null) {
        return null;
      } else {
        print("${currentUser.uid} === $currentUser");
        return currentUser;
      }
    } catch (e) {
      print("ERROR GETTING USER : $e");
    }
  }

  void logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
