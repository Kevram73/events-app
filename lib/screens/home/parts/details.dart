import 'package:evant/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 109, 117, 129),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: _size.width / 4,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorGame.lightPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: _size.width * 2 / 3,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.all(15),
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          hintText: "Recherchez",
                          prefixIcon: Padding(
                              padding:
                                  EdgeInsets.only(top: 14, left: 12, right: 8),
                              child: FaIcon(FontAwesomeIcons.search,
                                  size: 20, color: Colors.black)),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 30, bottom: 10),
                    child: Text(
                      "Evènements",
                      style: TextStyle(
                          fontSize: 28,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      width: 50,
                      height: 10,
                      color: ColorGame.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Vos invités",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Voir tout",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Card(
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage("assets/fontback.jpg"),
                              ),
                            ),
                            Container(
                              child: Column(children: [
                                Text(
                                  "Cycles Sales Meeting",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.check_rounded),
                                      title: Text(
                                        "Friday 1 - 7 pm",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.check_rounded),
                                      title: Text(
                                        "Friday 1 - 7 pm",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Card(),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Card(),
                    ),
                  ]),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nouveautés",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Voir tout",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Card(),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Card(),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Card(),
                    ),
                  ]),
                )),
              ),
            ],
          ),
        ));
  }
}
