
import 'package:animals/get_animal.dart';
// import 'package:animals/single_animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
    //   SingleAnimal(),
    // );

    Scaffold(
       body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/landing_page.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 70,),
              Container(
                // height: 100,
                width: 280,
                child: Column(
                  children: [
                    Text(
                      "Make a new Friend",
                      style: TextStyle(
                          color: Color(0xFF3D015B),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Find the best pet in your location and get them in your arms",
                      style: TextStyle(
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 68,),


                 Letsgo(),


            ],
          ),
        ),
      ),
   );
  }
}

class Letsgo extends StatelessWidget {
  const Letsgo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                PetCorner(
                ),
          ),
        );
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 50,
              width: 260,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF3D015B),
              ),
              child: Center(
                child:  Text(
                  "LET'S GO",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),

              ),
            ),

            Positioned(
              right: 4,top: 4,bottom: 4,
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/forward.png")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
