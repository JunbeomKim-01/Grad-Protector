import 'package:flutter/material.dart';
import 'package:grade_protector/screen/Quiz.dart';
import 'package:grade_protector/screen/Task.dart';

import 'Lec.dart';

class Scroll_Page extends StatefulWidget {
  final String? selec;
  Scroll_Page(@required this.selec);
  @override
  _Scroll_PageState createState() => _Scroll_PageState();
}

class _Scroll_PageState extends State<Scroll_Page> {
  final img= [
    "image/lec1.png",
    "image/quize1.png",
    "image/task1.png",
  ];
  final texts=["강의","퀴즈","과제"];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("image/pexels-moose-photos-1037995.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          body: ListView.separated(
              separatorBuilder:(BuildContext context,int index){
                return SizedBox(
                  height: 80,
                );
              },
              padding: EdgeInsets.only(top: 70,left: 10,right: 10),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index){
                //print(Scroll_Page().selec);
                return Hero(
                  tag: texts[index],
                  child: FlatButton(
                    onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_){
                       return index==0?Lec(img[index],widget.selec):index==1?Quize(img[index],widget.selec):Task(img[index],widget.selec);
                     }));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.43,
                          padding: EdgeInsets.only(top: 30,bottom: 30),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      img[index]
                                  ),
                                  fit: BoxFit.fill
                              ),
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(Radius.circular(60))
                          ),
                        ),
                        Positioned(
                            top: 30,
                            right: 70,
                            child: Text(texts[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 45
                              ),))
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

