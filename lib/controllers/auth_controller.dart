// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:todey/services/sp_service.dart';

// class AuthService extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   var isSignedIn = false.obs;
//   var userImageUrl = "".obs;

//   SP spService = SP();

//   @override
//   void onReady() {
//     super.onReady();
//     fetchUser();
//   }

//   signInWithGooogle(BuildContext context) async {
//     try {
//       final GoogleSignInAccount googleSignInAccount =
//           await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken);

//       final UserCredential authResult =
//           await _auth.signInWithCredential(credential);

//       final User user = authResult.user;
//       if (user != null) {
//         isSignedIn.value = false;
//         userImageUrl.value = user.photoURL;
//         SP.setLogged(true);

//         //Replace screen
//         // Navigator.pushReplacement(context,
//         //     MaterialPageRoute(builder: (BuildContext context) {
//         //   return HomePage();
//         // }));

//         final User currentUser = _auth.currentUser;
//         return '$currentUser';
//       }
//     } catch (e) {
//       print(e);
//       SP.setLogged(false);
//     }
//   }

//   signOut(BuildContext context) async {
//     try {
//       await googleSignIn.signOut().then((val) {
//         print(val);
//         if (val == null) {
//           //clear all data
//           SP.clearAll();
//           //Replace screen
//           // Navigator.pushReplacement(context,
//           //     MaterialPageRoute(builder: (BuildContext context) {
//           //   return Onboarding();
//           // }));
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   fetchUser() async {
//     isSignedIn.value = await SP.getLogged();
//   }
// }
