import 'package:firebase_login/auth_controller.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  String email;

  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width; // width of the screen
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/signup.png"), fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.17,),
                        const CircleAvatar(
                          backgroundColor: Colors.white70,
                          radius: 60,
                          backgroundImage: AssetImage(
                              "img/profile1.png"
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                        Text(
                            email,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 20
                          ),
                        )

                      ],
                    ),
                  ),
                  const SizedBox(height: 200,),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.logout();
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
                            "Sign out",
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
               ]
            )
        )
    );
  }
}
