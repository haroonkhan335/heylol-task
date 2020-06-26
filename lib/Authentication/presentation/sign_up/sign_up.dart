import 'package:flutter/material.dart';
import 'package:heyloltask/FirebaseDatabase/firebase_functions.dart';
import 'package:heyloltask/Home/home.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  String email;
  String password;
  String name;

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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          SetInterestVideos()));
                                  // var result = signUp(
                                  //     emailController.text,
                                  //     passwordController.text,
                                  //     nameController.text,
                                  //     signUpKey);
                                  // if (result != null) {
                                  //   Navigator.of(context).push(
                                  //       MaterialPageRoute(
                                  //           builder: (context) => Home()));
                                  // }
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

class SetInterestVideos extends StatefulWidget {
  @override
  _SetInterestVideosState createState() => _SetInterestVideosState();
}

class _SetInterestVideosState extends State<SetInterestVideos> {
  TextEditingController interestsController = TextEditingController();
  GlobalKey<FormState> interestKey = GlobalKey<FormState>();
  headToRegistration() {
    if (interestKey.currentState.validate()) {
      interestKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            child: Form(
              key: interestKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) {
                      interestsController.text = value;
                    },
                    validator: (value) {
                      var array = value.split(",");
                      var firstInterest = array[0];
                      var secondInterest = array[1];

                      if (!value.contains(',')) {
                        return "Please enter only two points of interests separated by a single ','";
                      } else if (array.length > 2) {
                        return "Please only specify two points of interests";
                      } else {
                        return null;
                      }
                    },
                    controller: interestsController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      headToRegistration();
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      color: Colors.green,
                      child: Center(child: Text("Set")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
