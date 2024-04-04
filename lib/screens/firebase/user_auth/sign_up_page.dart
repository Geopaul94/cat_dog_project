import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petapp/firebase/firebase.dart';
import 'package:petapp/screens/firebase/user_auth/login_page.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

//start from here
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 16, 24, 177),
                Color.fromARGB(255, 143, 145, 186),
              ],
            ),
          ),
          child: Column(children: [
            const SizedBox(height: 5),
            Column(children: [
              Container(
                child: Lottie.asset(
                  'assets/cat dog lady.json',
                ),
              ),
              Container(
                // margin: const EdgeInsets.only(top: 10),
                width: 300,
                height:
                    345, // Increased height to accommodate new TextFormField
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 1, 1, 1).withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your valid email';
                          } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid Gmail or Outlook email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: "Username", // Added field for username
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _obscureText == false
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signUp();
                            }
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 97, 182, 55),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 246, 244, 244),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: ' Log in',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  BottomNavigator(indexe: 2,)),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ]),
          ]),
        )));
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;

    try {
      
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      
      FirebaseServices()
          .addUser(email: email,user: username,phone: "",userImage: '', address: '');

     
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavigator(indexe: 3,)),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
