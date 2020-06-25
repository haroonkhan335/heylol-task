import 'package:firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heyloltask/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                        onFieldSubmitted: (input) {},
                        controller: emailController,
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
                        onFieldSubmitted: (input) {},
                        controller: passwordController,
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
                              onTap: () {},
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

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  String email;
  String password;
  String name;

  void signUp() async {
    if (signUpKey.currentState.validate()) {
      signUpKey.currentState.save();
      String email = emailController.text;
      String password = passwordController.text;
      try {
          var authResult  = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(authResult.user);
      } catch (e) {
        print("ERROR: $e");
      }
    }
  }

  void signIn(email, password) async {
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Form(
                    key: signUpKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          onSaved: (input) {
                            nameController.text = input;
                          },
                          validator: (input) {
                            if (input.length < 3) {
                              return "Name too short";
                            } else {
                              return null;
                            }
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          onSaved: (input) {
                            emailController.text = input;
                          },
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) {
                            if (!input.contains("@") ||
                                !input.contains(".com") ||
                                input.length < 9) {
                              return "Please use a valid email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          onSaved: (input) {
                            passwordController.text = input;
                          },
                          validator: (input) {
                            if (input.length < 6) {
                              return "Password must be 6 or more characters long";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                                onTap: () {
                                  signUp();
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => Home()));
                                },
                                child: Center(
                                  child: Text(
                                    "Sign Up",
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
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: <Widget>[
                      Text("Have an account?"),
                      Text("Sign in!")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
