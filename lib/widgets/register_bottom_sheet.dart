import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_bottom_sheet.dart'; // Adjust the import path according to your project structure

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  bool _obscureUsernameEmail = false;
  bool _obscureCourse = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

  // final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _courseController = TextEditingController();
  final _usernameController = TextEditingController();

  // validate and register user
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // This ensures the bottom sheet is responsive to content size
      builder: (BuildContext context) {
        return const LoginBottomSheet();
      },
    );
  }

  void _toggleUsernameEmailVisibility() {
    setState(() {
      _obscureUsernameEmail = !_obscureUsernameEmail;
    });
  }

  void _toggleCourseVisibility() {
    setState(() {
      _obscureCourse = !_obscureCourse;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform registration logic here
      print("Registration successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 236, 170, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello...',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(5, 5, 34, 1),
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(5, 5, 34, 1),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      size: 30,
                      CupertinoIcons.xmark_circle,
                      color: Color(0xffEF5858),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _usernameController,
                obscureText: _obscureUsernameEmail,
                decoration: InputDecoration(
                  labelText: "username/email",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Color(0xff050522),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureUsernameEmail
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: const Color(0xff050522),
                    ),
                    onPressed: _toggleUsernameEmailVisibility,
                  ),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _courseController,
                obscureText: _obscureCourse,
                decoration: InputDecoration(
                  labelText: "course",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Color(0xff050522),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureCourse
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: const Color(0xff050522),
                    ),
                    onPressed: _toggleCourseVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "password",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Color(0xff050522),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? CupertinoIcons.lock
                          : CupertinoIcons.lock_open,
                      color: const Color(0xff050522),
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: "confirm password",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Color(0xff050522),
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? CupertinoIcons.lock
                          : CupertinoIcons.lock_open,
                      color: const Color(0xff050522),
                    ),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                ),
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000000),
                  minimumSize: Size(MediaQuery.of(context).size.width - 80, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xFF000000),
                      width: 3,
                    ),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 222, 105, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 2.66,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _showLoginBottomSheet(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFEF5858),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
