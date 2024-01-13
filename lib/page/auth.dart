import 'package:e_learning/page/home.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/utils/validators.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _authFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  bool _isSignup = true;

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void signup() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isSignup ? "Create an \naccount!" : "Welcome\nBack!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30), //_isSignup ? 30 : 30),
                  Form(
                    key: _authFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
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
                        const SizedBox(height: 15), // Increased height
                        Visibility(
                          visible: _isSignup,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: "Phone Number",
                                  prefixIcon: const Icon(Icons.phone),
                                ),
                                validator: (number) {
                                  if (number == null) {
                                    return "The Phone number should not be empty";
                                  }
                                  if (!isPhoneNumber(number.trim())) {
                                    return "Enter a valid phone number";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15), // Increased height
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
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
                        const SizedBox(height: 15), // Increased height
                        Visibility(
                          visible: _isSignup,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: "Confirm Password",
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                                validator: (password) {
                                  if (password == null) {
                                    return "The password should not be empty";
                                  }
                                  if (!isPassword(password.trim())) {
                                    return "The password must have at least 6 characters";
                                  }
                                  if (_passwordController.text != password) {
                                    return "The passwords do not match";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15), // Increased height
                              TextFormField(
                                controller: _collegeController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: "College",
                                  prefixIcon: const Icon(Icons.school_outlined),
                                ),
                              ),
                              const SizedBox(height: 15), // Increased height
                              TextFormField(
                                controller: _branchController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: "Branch",
                                  prefixIcon: const Icon(Icons.book_outlined),
                                ),
                              ),
                              const SizedBox(height: 15), // Increased height
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: _isSignup ? signup : login,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(113, 187, 0, 255)
                                  .withOpacity(0.5),
                            ),
                            width: MediaQuery.of(context).size.width - 225,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Center(
                              child: Text(
                                _isSignup ? "Signup" : "Login",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10), // Increased height
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isSignup = !_isSignup;
                            });
                          },
                          child: Text(
                            _isSignup
                                ? "Already a User?   Login!"
                                : "New to E Learning?   Signup!",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
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
