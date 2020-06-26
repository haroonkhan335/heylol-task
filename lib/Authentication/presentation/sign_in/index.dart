import 'package:flutter/material.dart';
import 'package:heyloltask/Authentication/presentation/sign_in/controller.dart';
import 'package:heyloltask/Authentication/presentation/sign_up/sign_up.dart';
import 'package:heyloltask/FirebaseDatabase/firebase_functions.dart';
import 'package:heyloltask/Home/home.dart';


class SignIn extends StatelessWidget {
 LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        onFieldSubmitted: (input) {
                          store.emailController.text = input;
                        },
                        controller: store.emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        onSaved: (input) {
                          store.passwordController.text = input;
                        },
                        controller: store.passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                var loginResult = await login(
                                    email: store.emailController.text,
                                    password: store.passwordController.text);
                                    print("LINE 69 - $loginResult");
                                if (loginResult != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Home()));
                                }
                              },
                              child: Center(
                                child: Text(
                                  "Sign In",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Column(
                  children: <Widget>[
                    Text("Don't Have an Account?"),
                    Text("Sign up!")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
