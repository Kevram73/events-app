import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/back-one.jpg",
                ),
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 94, 90, 90).withOpacity(0.8),
                  BlendMode.modulate,
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 3,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              padding: const EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(
                      103, 150, 158, 151), //here i want to add opacity

                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(hintText: "Email"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Continue",
                            style: TextStyle(
                              fontSize: 20,
                            ))))
              ]),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
