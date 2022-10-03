import 'package:firebase_login/auth_controller.dart';
import 'package:firebase_login/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // width of the screen
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/loginimg.png"), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello",
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Sign in into your acccount",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.email, color: Colors.deepOrange,),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // textf field

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.password, color: Colors.deepOrange,),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Forgot your password?",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                width: width * .5,
                height: height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage("img/loginbtn.png"), fit: BoxFit.cover),
                ),
                child: const Center(
                    child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),

            SizedBox(height: width * 0.08,),

            RichText(text: TextSpan(
              text: "Don't hava an account? ",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20
              ),
              children: [
                 TextSpan(
              text: "Create",
              recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignupPage()),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
              ),
              ]
            ),
           )

          ],
        ),
      ),
    );
  }
}
