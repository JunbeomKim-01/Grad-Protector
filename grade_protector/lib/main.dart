import 'package:flutter/material.dart';
import 'package:grade_protector/util/Login_Control.dart';
import 'package:grade_protector/screen/home_page.dart';
import 'package:grade_protector/Color/colors.dart';

void main() {
  runApp(MaterialApp(home: new Loginpage()));
}

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  double _width=0;
  double _height =0;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  bool flag =false;
  List<String> texts=["시작하기","뒤로가기"];
  final _formKey = GlobalKey<FormState>();

  // 텍스트필드 컨트롤러 삭제
  final FocusNode _pwFocus = FocusNode(); // pw 포커스
  Color autoLoginButtonColor = Colors.blueAccent;
  bool autoLogin = true;
  String? email = null;
  String? password = null;
  Map<String,dynamic> idpw={};

  Color r_color = Use_Colors().get_R_colors();
  Color mint = Use_Colors().get_mint_colors();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("./image/pexels-moose-photos-1037995.jpg"), fit: BoxFit.cover,),
                ),
              ),
              new Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    new Text("학적관리 시스템에 오신 것을 환영합니다.",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    new AnimatedContainer(
                      height: _height,
                        width: _width,
                        curve: Curves.fastOutSlowIn,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: _borderRadius),
                        duration: Duration(seconds: 1),
                      child:Login(context),
                    ),
                    TextButton(
                        onPressed:(){
                          setState(() {
                            if(flag){
                              _width = 0;
                              _height = 0;
                              _borderRadius =
                                  BorderRadius.circular(8);
                              flag=false;
                            }
                            else{
                              flag= true;
                              _width = 300;
                              _height = 300;
                              _borderRadius =
                                  BorderRadius.circular(20);
                            }
                          });
                        },
                        child: Text(
                          flag==true?"뒤로가기":"시작하기"
                        ,style: TextStyle(color: Colors.black),))
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget Login(BuildContext context){
    return Container(
      height: 400,
      width: 300,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 6,
            child: Container(
              child: Form(
                key: _formKey,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 45,
                          child: Theme(
                            data: new ThemeData(
                              hintColor: mint
                            ),
                            child: TextFormField(
                              cursorColor: mint,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: new InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.cyan),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: r_color)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                      width: 2, color: mint),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                      width: 3, color: mint),
                                ),
                                labelText: '아이디 입력',
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 2, color: r_color)),
                              ),
                              onSaved: (String? value) {
                                email = value!;
                              },
                              validator: LoginControl().validateEmail,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(_pwFocus);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 45,
                            child: Theme(
                              data: new ThemeData(
                                hintColor: Colors.white,
                              ),
                              child: TextFormField(
                                // 숫자 입력 키보드
                                cursorColor: r_color,
                                focusNode: _pwFocus,
                                // 포커스 생성
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                textInputAction: TextInputAction.done,
                                // 엔터키 텍스트
                                obscureText: true,
                                decoration: new InputDecoration(
                                  labelStyle: TextStyle(
                                      color:
                                      Colors.pinkAccent),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 1, color: r_color)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 2, color: r_color),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)),
                                      borderSide: BorderSide(
                                          width: 1, color: r_color)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 3, color: r_color),
                                  ),
                                  labelText: '비밀번호 입력',
                                ),

                                onSaved: (String? value) {
                                  password = value!;
                                },
                                validator: LoginControl().validatePassword,
                                onFieldSubmitted: (temp) async {},
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 100 ,
                              height: 35 ,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 7.0, left: 2.0),
                                child: GestureDetector(
                                  onDoubleTap: () {},
                                  onTap: () {},
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8)),
                                    color: Colors.blue,
                                    onPressed: () async {
                                      if (_formKey.currentState!
                                          .validate()) {
                                        _formKey.currentState!.save();
                                        // 키보드 닫기 => 에러 수정해야함 로그인 실패시 예외처리
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());

                                        Future.delayed(
                                            Duration(milliseconds: 500),
                                                () async {
                                              await LoginControl().requestLogin(context,
                                                  email, password,
                                                  autoLoginPermission:
                                                  autoLogin,
                                                  type: 2);
                                            });
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => Home_page()),
                                        // );
                                      }
                                    },
                                    child: Text("로그인",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                          10,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Container(),
                              ),
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15.0),
                                  child: InkWell(
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Row(children: <Widget>[
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: autoLoginButtonColor,
                                            size:
                                            20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, bottom: 2.0),
                                            child: Container(
                                              child: Text("자동 로그인",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                          )
                                        ])),
                                    onTap: () {
                                      autoLogin == true
                                          ? autoLogin = false
                                          : autoLogin = true;
                                      setState(() {
                                        autoLogin == true
                                            ? autoLoginButtonColor =
                                        Colors.blue
                                            : autoLoginButtonColor =
                                            Colors.black;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
