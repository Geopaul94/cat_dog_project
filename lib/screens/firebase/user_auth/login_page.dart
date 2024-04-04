import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:petapp/screens/firebase/user_auth/sign_up_page.dart';
import 'package:petapp/screens/main_pages/bottom_navigator.dart';
import 'package:petapp/screens/widget_refractoring/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email = '';
  // String _password = '';
  // bool _emailValid = false;
  // bool _passwordValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            return dismissKeyboard(context);
          },
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const OnbordingContainers(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Lottie.asset(
                    'assets/dog.json',
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 285,
                  height: 270,
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
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            // errorText: _emailValid ? null : 'Please enter a valid email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          // onChanged: (value) {
                          //   setState(() {
                          //     _emailValid = RegExp(
                          //       r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$',
                          //     ).hasMatch(value);
                          //   });
                          // },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@(gmail|outlook)\.com$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid Gmail or Outlook email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordController,
                          obscureText:
                              _obscureText, // Use the state variable to control visibility
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
                          // onChanged: (value) {
                          //   setState(() {
                          //     // _password = value;
                          //     // _passwordValid = value.length >= 8;
                          //   });
                          // },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signIn();
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                          (route) => false, // Remove all previous routes
                        ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _signIn() async {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     print("Successful login");

  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const BottomNavigator()),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print("Failed to login: $e");
  //   }
  // }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Successful login");

      // Use a mounted check to ensure the widget is still active
      if (!mounted) return; // Prevent errors if the widget is unmounted

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BottomNavigator(
                  indexe: 2,
                )),
      );
    } on FirebaseAuthException catch (e) {
      print("Failed to login: $e");
    }
  }

  void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
