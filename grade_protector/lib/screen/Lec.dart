import 'package:flutter/material.dart';
import 'package:grade_protector/APi/Api.dart';
import 'package:flutter/cupertino.dart';

class Lec extends StatelessWidget {
  final String _image;
  final String? _selec;
  Lec(this._image,this._selec);


  String lec_list="";
  List<String> tmp = [];
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
                        tag:"강의",
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
                                      Text('강의',
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
                        future: Api().getlectrue(),
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
                            for(var inls in snapshot.data['data']['body'][_selec.toString()+'[A]'].keys){
                              tmp.add(inls.toString());
                            }
                            print(tmp);
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
                                itemCount:snapshot.data['data']['body'][_selec.toString()+'[A]'].keys.length,//주차 length
                                itemBuilder: (BuildContext context, int index){
                                  int now=index;
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
                                                          child: Text(tmp[now].toString()+"주차",
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
                                              itemCount:snapshot.data['data']['body'][_selec.toString()+'[A]'][tmp[index].toString()].length ,
                                              itemBuilder:(BuildContext context, int index){
                                            return Card(
                                              child: Container(
                                                child: ListTile(
                                                  leading: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][tmp[now].toString()][index][0].toString()+":  "+snapshot.data['data']['body'][_selec.toString()+'[A]'][tmp[now].toString()][index][1].toString(),
                                                    style:TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                    ) ,),
                                                  title: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][tmp[now].toString()][index][3].toString(),
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontStyle: FontStyle.italic,
                                                    ),),
                                                  trailing: Text(snapshot.data['data']['body'][_selec.toString()+'[A]'][tmp[now].toString()][index][2].toString()),
                                                ),
                                              ),
                                            );
                                          }),
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
                                itemCount: 2,//snapshot.data['data']['body'][_selec.toString()+'[A]'][index.toString()].length+1,//주차 length
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
