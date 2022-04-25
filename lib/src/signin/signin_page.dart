import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

// editing controller
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

// firebase
final _auth = FirebaseAuth.instance;

// string for displaying the error Message
String? errorMessage;

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'IDENTIFICATION',
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
                signIn(),
                const Divider(height: 2, color: Colors.black),
                createAccount(),
              ])),
        ),
      ),
    );
  }
}

Widget signIn() => Column(
      children: [
        const SizedBox(height: 20),
        Image.asset('assets/images/logo-trans_black.png'),
        const SizedBox(height: 20),
        Text(
          'I ALREADY HAVE AN ACCOUNT',
          style: GoogleFonts.montserrat(fontSize: 22),
        ),
        const SizedBox(height: 80),
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
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Forgot your password?',
              style: GoogleFonts.montserrat(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text(
              'Sign In',
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

Widget createAccount() => Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              "I DON'T HAVE AN ACCOUNT",
              style: GoogleFonts.montserrat(fontSize: 22),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Enjoy added benefits and a richer experience by creating a personal account',
          style: GoogleFonts.montserrat(fontSize: 16),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text(
              'Create My Account',
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
