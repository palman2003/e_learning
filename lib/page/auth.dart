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
        padding: const EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isSignup ? "Create an account!" : "Welcome\nBack!",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: _isSignup ? 20 : 50),
                Form(
                  key: _authFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
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
                      const SizedBox(height: 20),
                      Visibility(
                        visible: _isSignup,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                labelText: "Phone Number",
                                prefixIcon: Icon(Icons.numbers),
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
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (password) {
                          if (password == null) {
                            return "The password should not be empty";
                          }
                          if (!isPassword(password.trim())) {
                            return "The password must have atleast 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: _isSignup,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                labelText: "Confirm Password",
                                prefixIcon: Icon(Icons.lock_outline),
                              ),
                              validator: (password) {
                                if (password == null) {
                                  return "The password should not be empty";
                                }
                                if (!isPassword(password.trim())) {
                                  return "The password must have atleast 6 characters";
                                }
                                if (_passwordController.text != password) {
                                  return "The passwords do not match";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _collegeController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                labelText: "College",
                                prefixIcon: Icon(Icons.school_outlined),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _branchController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                labelText: "Branch",
                                prefixIcon: Icon(Icons.book_outlined),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Ink(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            border: Border.all(color: Colors.grey)),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          onTap: _isSignup ? signup : login,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Center(
                              child: Text(
                                _isSignup ? "Signup" : "Login",
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isSignup = !_isSignup;
                          });
                        },
                        child: Text(_isSignup
                            ? "Already a User?   Login!"
                            : "New to E Learning?   Signup!"),
                      ),
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
