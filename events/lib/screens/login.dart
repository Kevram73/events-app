import 'package:events/services/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 20),
                child: Container(
                  child: const Text(
                    "Log In",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: TextField(
                  cursorColor: primaryColor,
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.headline4,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0)))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
