import 'dart:convert';
import 'package:e_learning/page/forget_password.dart';
import 'package:e_learning/page/home.dart';
import 'package:e_learning/page/signup.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/utils/validators.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SharedPreferences prefs;

  void login() async {
    prefs = await SharedPreferences.getInstance();

    if (!_loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      var response = await http.post(
        Uri.parse("http://${dotenv.env["MY_IP"]}:3000/v1/api/user/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "email": _emailController.text,
            "password": _passwordController.text,
          },
        ),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode > 399) {
        throw responseData["message"];
      }

      await prefs.setString("token", responseData["token"]);

      if (!mounted) {
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }

  void forgetPassword() async {
    if (_emailController.text == null || _emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email"),
        ),
      );
      return;
    }
    if (!isEmail(_emailController.text)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter valid email"),
        ),
      );
      return;
    }

    try {
      var response = await http.post(
        Uri.parse(
            "http://${dotenv.env["MY_IP"]}:3000/v1/api/reset/forgot-password"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "email": _emailController.text,
          },
        ),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode > 399) {
        throw responseData["message"];
      }

      if (!mounted) {
        return;
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ForgetPassword(
            email: _emailController.text,
          ),
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome\nBack!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.symmetric(
                            //   vertical: 15,
                            //   horizontal: 15,
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: "Email",
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          validator: (email) {
                            if (email == null) {
                              return "The email should not be empty";
                            }
                            if (!isEmail(email.trim())) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.symmetric(
                            //   vertical: 15,
                            //   horizontal: 15,
                            // ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock_outline),
                          ),
                          validator: (password) {
                            if (password == null) {
                              return "The password should not be empty";
                            }
                            if (!isPassword(password.trim())) {
                              return "The password must have at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: login,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(58, 142, 66, 255),
                            ),
                            width: MediaQuery.of(context).size.width - 225,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: ((context) => const SignupPage()),
                              ),
                            );
                          },
                          child: const Text(
                            "New to E Learning?   Signup!",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: forgetPassword,
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text("Test Navigate"),
                        )
                      ],
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
