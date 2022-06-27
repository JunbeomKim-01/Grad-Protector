import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'Api_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:grade_protector/util/storage.dart';
import 'package:grade_protector/util/database.dart';

class Api {
  final String path = Api_info.url;
  static Map<String, dynamic> result = {};
  var response=null;
  Map<String?, String?> body = {};
  Map<String?, String?> header = {};
  final String _url = Api_info.Local_url;
  static String? id;
  static String? pw;
  String uri="";
  var sseionKey="";

  Future<Map<String, dynamic>> getLoginAuth(String? id, String? pw) async {
    //print(id);
    //print(pw);
    body = {'id_': id, 'password_': pw};
    try {
    response = await http
        .get(Uri.parse(_url+"/login?id_=${body['id_']}&password_=${body['password_']}"),
        headers: {
          'accept': 'application/json',
        })
        .timeout(const Duration(seconds: 3));

      if(response.statusCode== 200){
        if(response.body == null){
          result={'result':false,'error':'empty'};
      }
        else{
          result={'result':true,};
          if(Storage.isExistSession() == false){
            Storage.setSession((json.decode(response.body)['session']));
          }
        }
      }
      else{
        result = {'result': false, 'err': 'reload'};
      }
    } catch (Exception) {
      result = {'result': false, 'err': Exception};
  }
    print(result);
    return result;
  }

  Future<Map<String,dynamic>> getQuiz() async{
    sseionKey =await Storage.getSession();
    uri=_url+"/quiz?session_key="+sseionKey;
    response= await http.get(
      Uri.parse(uri),
      headers: {
        'accept': 'application/json',
      }
    );
//.timeout(const Duration(seconds: 6))
     if(!(convert.utf8.decode(response.bodyBytes)== null))
        result=json.decode(convert.utf8.decode(response.bodyBytes));
    //result=json.decode(response.body)['data'];
    //await Data.setQuizdata(result['data']['body'] as Map<String,dynamic>);
    return result;
  }

  Future<Map<String,dynamic>> getassign() async{
    sseionKey= await Storage.getSession();
    uri=_url+"/assign?session_key="+sseionKey;
    response= await http.get(
        Uri.parse(uri),
        headers: {
          'accept': 'application/json',
        }
    );
    if(!(convert.utf8.decode(response.bodyBytes)== null))
      result=json.decode(convert.utf8.decode(response.bodyBytes));
    //await Data.setAssignData(result['data']['body'] as Map<String,dynamic>);
    return result;
  }

  Future<Map<String,dynamic>> getcourse() async{
    sseionKey= await Storage.getSession();
    uri=_url+"/course?session_key="+sseionKey;
    response= await http.get(
        Uri.parse(uri),
        headers: {
          'accept': 'application/json',
        }
    );
    if(!(convert.utf8.decode(response.bodyBytes)== null))

      result=json.decode(convert.utf8.decode(response.bodyBytes));
    await Storage.setCurse(result['data']['body']);
    return result;
  }

  Future<Map<String,dynamic>> getlectrue() async{
    sseionKey= await Storage.getSession();
    uri=_url+"/lecture?session_key="+sseionKey;
    response= await http.get(
        Uri.parse(uri),
        headers: {
          'accept': 'application/json',
        }
    );
    if(!(convert.utf8.decode(response.bodyBytes)== null))
      result=json.decode(convert.utf8.decode(response.bodyBytes));
    return result;
  }
}

