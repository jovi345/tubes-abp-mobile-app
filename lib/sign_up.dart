import 'package:flutter/material.dart';
import 'package:mobile/clipper.dart';
import 'package:mobile/clipper2.dart';
import 'package:mobile/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassword = TextEditingController();
  var nameController = TextEditingController();

  Widget _buildName() => Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(3, 3),
          blurRadius: 6,
          color: Colors.grey.shade400,
        ),
      ],
    ),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your name";
        }
      },
      controller: nameController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14),
        prefixIcon: Icon(Icons.person_outlined),
        hintText: "Enter your name",
      ),
    ),
  );

  Widget _buildEmail() => Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(3, 3),
          blurRadius: 6,
          color: Colors.grey.shade400,
        ),
      ],
    ),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your email";
        }
      },
      controller: emailController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14),
        prefixIcon: Icon(Icons.email_outlined),
        hintText: "Enter your email",
      ),
    ),
  );

  Widget _buildPassword() => Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(3, 3),
          blurRadius: 6,
          color: Colors.grey.shade400,
        ),
      ],
    ),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your password";
        }
      },
      controller: passwordController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14),
        prefixIcon: Icon(Icons.lock_outline_rounded),
        hintText: "Enter your password",
      ),
    ),
  );

  Widget _buildConfirmPassword() => Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(3, 3),
          blurRadius: 6,
          color: Colors.grey.shade400,
        ),
      ],
    ),
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your confirm password";
        }
      },
      controller: passwordController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14),
        prefixIcon: Icon(Icons.lock_outline_rounded),
        hintText: "Enter your confirm password",
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 300),
                      painter: RPSCustomPainter(),
                    ),
                    Positioned(
                      top: 16,
                      right: -5,
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 300),
                        painter: PSCustomPainter(),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Registration',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 26,
                            ),
                          ),
                          Text(
                            'Please sign up to continue.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 25),
                      _buildName(),
                      const SizedBox(height: 25),
                      _buildEmail(),
                      const SizedBox(height: 20),
                      _buildPassword(),
                      const SizedBox(height: 20),
                      _buildConfirmPassword(),
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(180, 0, 240, 159),
                              Color.fromARGB(255, 0, 240, 159),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Text(
                              'REGISTER',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 240, 160),
                              ),
                            ),
                          ),
                        ],
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
