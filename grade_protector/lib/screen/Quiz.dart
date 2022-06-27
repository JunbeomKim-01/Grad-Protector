import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grade_protector/Color/colors.dart';
import 'package:grade_protector/util/database.dart';
import 'package:grade_protector/APi/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:grade_protector/util/storage.dart';

class Quize extends StatelessWidget {
  final String _image;
  final String? _selec;
  Quize(this._image,this._selec);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  Scaffold(
            body:Stack(
              children: [
                Column(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Hero(
                        tag:"퀴즈",
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(_image),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 10,
                              child: Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('퀴즈',
                                        style: TextStyle(
                                          fontSize:30,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(_selec.toString(),
                                        style:TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),),
                    Flexible(
                      flex: 7,
                      child: FutureBuilder(
                        future: Api().getQuiz(),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                          else if(snapshot.hasError){
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                          else{
                            print(snapshot.data['data']['body'][_selec.toString()+"[A]"]);
                            print(_selec);
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image/pexels-moose-photos-1037995.jpg"),
                                      fit: BoxFit.cover
                                  )
                              ),
                              height: MediaQuery.of(context).size.height,
                              child: snapshot.data['data']['body'][_selec.toString()+'[A]'] != null?
                              ListView.separated(
                                separatorBuilder:(BuildContext context,int index){
                                  return SizedBox(
                                    height: 1,
                                  );
                                },
                                itemCount: snapshot.data['data']['body'][_selec.toString()+'[A]'].length,//주차 length
                                itemBuilder: (BuildContext context, int index){
                                  return Container(
                                    height: MediaQuery.of(context).size.height*0.3,
                                    child: Column(
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    color: Colors.transparent,
                                                  ),
                                                  Positioned(
                                                      bottom: 40,
                                                      top: 10,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.all(Radius.circular(34))
                                                        ),
                                                        padding: EdgeInsets.all(4.0),
                                                        height: 100,
                                                        width: 300,
                                                        child: Center(
                                                          child: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][index][0],
                                                            style:TextStyle(
                                                              fontSize: 20,
                                                            ),),
                                                          //   Text(snapshot.data['data']['body'][_selec],
                                                          // style:TextStyle(
                                                          //   fontSize: 20,
                                                          // ),),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            )),
                                        Flexible(
                                          flex: 4,
                                          child: Card(
                                            child: Container(
                                              child: ListTile(
                                                leading: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][index][1].toString()),
                                                title: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][index][2]),
                                                trailing: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][index][3]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ):
                              ListView.separated(
                                separatorBuilder:(BuildContext context,int index){
                                  return SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: 1,//주차 length
                                itemBuilder: (BuildContext context, int index){
                                  //print(snapshot.data['data']['body']['컴퓨터네트워크설계[A]']);
                                  return Container(
                                    height: MediaQuery.of(context).size.height*0.3,
                                    child: Column(
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    color: Colors.transparent,
                                                  ),
                                                  Positioned(
                                                      bottom: 40,
                                                      top: 10,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.all(Radius.circular(34))
                                                        ),
                                                        padding: EdgeInsets.all(4.0),
                                                        height: 100,
                                                        width: 300,
                                                        child: Center(
                                                          child: Text("존재하지 않음",
                                                            style:TextStyle(
                                                              fontSize: 20,
                                                            ),),
                                                          //   Text(snapshot.data['data']['body'][_selec],
                                                          // style:TextStyle(
                                                          //   fontSize: 20,
                                                          // ),),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            )),
                                        Flexible(
                                            flex: 4,
                                            child: ListView.builder(
                                                itemCount: 1,
                                                itemBuilder: (BuildContext context,int index){
                                                  return  Card(
                                                    child: Container(
                                                      height: 50,
                                                      child: ListTile(
                                                        title:Center(
                                                          child: Text("과제 존재하지 않음"),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },

                      ),),],
                ),
                Positioned(
                    right: 10,
                    top: 40,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.backspace_outlined),
                      iconSize: 30,))
              ],
            )
        )
    );
  }
}
