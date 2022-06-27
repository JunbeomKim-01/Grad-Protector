import 'package:flutter/material.dart';
import 'package:grade_protector/APi/Api.dart';
import 'package:grade_protector/Color/colors.dart';
import 'package:grade_protector/screen/scroll_page.dart';
import 'package:grade_protector/APi/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:grade_protector/util/storage.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Color mint=Use_Colors().get_mint_colors();
  Color r_color = Use_Colors().get_R_colors();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home:  Scaffold(
        backgroundColor: r_color,
        appBar: AppBar(
          backgroundColor: mint,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              height: size.height*0.26,
                color: r_color,
                child: Stack(
                  children: [
                    Container(
                      height: size.height *0.2-10,
                      decoration: BoxDecoration(
                        color: mint,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(123),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                        left: size.width*0.36,
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                             color: Colors.white,
                            borderRadius: BorderRadius.circular(360)
                          ),
                        ))
                  ],
                )),
            Flexible(
                flex: 6,
                child: FutureBuilder(
                  future: Api().getcourse(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    else if(!snapshot.hasData){
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    else{
                      return ListView.separated(
                        padding: EdgeInsets.only(right: 20,left: 20,),
                        itemCount: Storage.surce.length,
                        itemBuilder: (BuildContext context,int index){
                          //print(Storage.surce[index]);
                          return Container(
                            height: 100,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Flexible(
                                    flex:3,
                                    child: Container(
                                      color: r_color,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(360))
                                            ),
                                          )
                                        ],
                                      ),
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.all(Radius.circular(360))
                                      // ),
                                    )),
                                Flexible(
                                    flex:6,
                                    child: Container(
                                      child:ListTile(
                                        title: Text(snapshot.data['data']['body'][index],
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width*0.036,
                                          ),),
                                        trailing: IconButton(
                                          iconSize: 40,
                                          icon: Icon(Icons.arrow_downward,color: r_color,),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Scroll_Page(snapshot.data['data']['body'][index].toString())),
                                            );
                                          },
                                        ),
                                      )
                                    )),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index)=> const Divider(),
                      );
                    }
                  },
                )),

          ],
        ),
      ),
    );
  }
}
