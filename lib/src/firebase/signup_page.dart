import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

// editing controller
final TextEditingController nameController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'REGISTRATION',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),
                const Divider(height: 2, color: Colors.black),
                signUp(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget signUp(BuildContext context) => Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey[300],
              child: const Icon(
                Icons.photo_camera,
                size: 50,
              ),
            ),
            const Positioned(
              right: 0,
              child: Icon(Icons.add, size: 35),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          autofocus: false,
          controller: nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Name");
            }
            return null;
          },
          onSaved: (value) {
            nameController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          autofocus: false,
          controller: usernameController,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Username");
            }
            return null;
          },
          onSaved: (value) {
            usernameController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_add),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          autofocus: false,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Email");
            }
            // reg expression for email validation
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Please Enter a valid email");
            }
            return null;
          },
          onSaved: (value) {
            emailController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          autofocus: false,
          controller: mobileController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Mobile Number");
            } // regular expression for mobile number validation
            if (!RegExp(r"^(?:\+88||01)?(?:\d{10}|\d{13})$").hasMatch(value)) {
              return ("Please Enter a valid email");
            }
            return null;
          },
          onSaved: (value) {
            mobileController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone_iphone),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Mobile (i.e. 01700112223)",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          autofocus: false,
          controller: passwordController,
          obscureText: true,
          validator: (value) {
            RegExp regex = RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return ("Password is required for login");
            } else if (!regex.hasMatch(value)) {
              return ("Enter Valid Password(Min. 6 Character)");
            }
          },
          onSaved: (value) {
            passwordController.text = value!;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () async {
            await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text)
                .then(
                  (value) => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SignInPage()),
                  ).onError((error, stackTrace) => debugPrint('Error: $error')),
                );
            
          },
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
