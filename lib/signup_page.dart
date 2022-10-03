import 'package:firebase_login/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
SignupPage({ Key? key }) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){



    List images = [
      "g.png",
      "t.png",
      "f.png"
    ];
    
    double width = MediaQuery.of(context).size.width; // width of the screen
    double height = MediaQuery.of(context).size.height;

     return Scaffold(
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
              margin: const EdgeInsets.only(left: 20, right: 20),
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
            const SizedBox(height: 20,),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              height: 70,
            ),

            GestureDetector(
              onTap: (){
                AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
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
                      "Signup",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ),

            const SizedBox(height: 10,),

            RichText(
                text: TextSpan(
                  text: "Have an account?",
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500]
                  )
                )
            ),

            SizedBox(height: width * 0.08,),

            RichText(text: TextSpan(
                text: "Sign up with ",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20
                )
            ),
            ),

            Wrap(
              children: List<Widget>.generate(
                3,
                  (index) {
                  return Padding(
                    padding:  const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[500],
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          "img/" + images[index]
                        ),
                      ),
                    ),
                  );
                  }
              ),
            )
          ]
        )
        )
     );
     

  }
}