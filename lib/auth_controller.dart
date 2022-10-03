import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/login_page.dart';
import 'package:firebase_login/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  static AuthController instance = Get.find();
  // email, password, name... (user)
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // user will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if(user == null) {
      print("login page");
      Get.offAll(()=>LoginPage());
    } else {
      Get.offAll(()=>WelcomePage(email: user.email!,));
    }
  }

  // user registration
  void register(String email, String password) async {
      try {
        await auth.createUserWithEmailAndPassword(email: email, password: password);
      } catch(e) {
        Get.snackbar("About user", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(
           color: Colors.white
          ),
        ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.white
            ),
          )
        );
      }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      Get.snackbar("About login", "login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
                color: Colors.white
            ),
          )
      );
    }
  }

  // log out
  void logout() async{
    await auth.signOut();
  }

}