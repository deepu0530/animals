import 'package:animals/get_animal.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'models/single_animal_model.dart';


class SingleAnimal extends StatefulWidget {
  SingleAnimal({this.title});
  final  String title ;
  @override
  _SingleAnimalState createState() => _SingleAnimalState();
}

class _SingleAnimalState extends State<SingleAnimal> {
  Singleanimal listTodos = Singleanimal();
  bool fetching = true;
  void getHttp() async {
    setState(() {
      fetching = true;
    });
    try {
      Response response =
      await Dio().get("https://networkintern.herokuapp.com/api/animal?name=${widget.title}");
      setState(() {
        listTodos = singleanimalFromJson(jsonEncode(response.data)) ;
        fetching = false;
        print(response);
      });
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (listTodos.image.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    // @override
    // Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        // Container(
        //   padding: EdgeInsets.only(top: 25),
        //   child:
        Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 29),
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  //color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage("https://source.unsplash.com/1000x1000/?cat,Lilly"),
                    fit: BoxFit.fill,
                    // image: AssetImage("assets/images/back.png"),
                    // height: 18,
                    // width: 18,

                  )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Text("${widget.nammme}" , style: TextStyle(color: Colors.green , fontSize: 30 , fontWeight: FontWeight.w400),),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PetCorner(
                                  ),
                            ),
                          );
                        },
                        child: Image(
                          image: AssetImage("assets/images/back.png"),
                          height: 18,
                          width: 18,
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/images/user.png"),
                        height: 26,
                        width: 26,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        // "Daisy",
                        "${listTodos.title}",
                        //"${widget.name}",

                        style: TextStyle(
                            color: Color(0xFF3D015B),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/images/location.png"),
                            height: 22,
                            width: 15,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            //"18 Miles",
                            "${listTodos.distance}",
                            style: TextStyle(
                                color: Color(0xFFADADAD),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " Miles",
                            //"${listTodos.distance}",
                            style: TextStyle(
                                color: Color(0xFFADADAD),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    //"Sweet Princess",
                    "${listTodos.subTitle}",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Gender: ",
                        //"${listTodos.gender}",
                        style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        //"Gender: Female",
                        "${listTodos.gender}",
                        style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 14,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PetDetails(name1: "Age: ",name2: "${listTodos.months}",name3: " Months",),
                      PetDetails(name1: "Length: ",name2: "${listTodos.length}",name3: " feet",),
                      PetDetails(name1: "Color: ",name2: "${listTodos.color}",name3: "",),
                      // Container(
                      //   height: 40,
                      //   width: 100,
                      //   //margin: const EdgeInsets.all(15.0),
                      //   //padding: const EdgeInsets.all(15.0),
                      //   decoration: BoxDecoration(
                      //     border:
                      //     Border.all(color: Color(0xFFCCCCCC), width: 1),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       //"Length: 1 feet",
                      //         "${listTodos.length}",
                      //       style: TextStyle(
                      //           color: Color(0xFF222222),
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),

                      // Container(
                      //   height: 40,
                      //   width: 100,
                      //   //margin: const EdgeInsets.all(15.0),
                      //   //padding: const EdgeInsets.all(15.0),
                      //   decoration: BoxDecoration(
                      //     border:
                      //     Border.all(color: Color(0xFFCCCCCC), width: 1),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       //"Color: White",
                      //         "${listTodos.color}",
                      //       style: TextStyle(
                      //           color: Color(0xFF222222),
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    //"A cat is a best friend of you. My cat is really intelligent and naughty. Her grey eyes make her more adorable. I want to give her on adoption due to some of my personal issues and she needs attention that I am not able to give her properly now.",
                    "${listTodos.description}",
                    style: TextStyle(
                        color: Color(0xFF5A5A5A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF3D015B),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 12,
                      color: Color(0x4D3D015B),
                    )
                  ]),
              child: Center(
                child: Text(
                  "ADOPT",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
      //),
    );
  }
}

class PetDetails extends StatefulWidget {
  const PetDetails({
    this.name1,this.name2,this.name3,
    Key key,
    //@required
    //this.listTodos,
  }) : super(key: key);

  //final Singleanimal listTodos;
  final String name1;
  final String name2;
  final String name3;

  @override
  _PetDetailsState createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      //margin: const EdgeInsets.all(15.0),
      //padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border:
        Border.all(color: Color(0xFFCCCCCC), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name1,
              //"${listTodos.months}",
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              // "Age: 6 Months",
              widget.name2,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              // "Age: 6 Months",
              widget.name3,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}







