import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  static String session = "";
  static List<dynamic> surce=[];

  static getSession() async{
   return Storage.session;

  }
  static setSession(String auth) async {
    session = auth;
    print(session);
  }
  static isExistSession() => session == "" ? false : true;


  static setCurse(var course) async{
    surce=course as List<dynamic>;
  }
  static getCurse() async{
    return surce;
  }

  static setAutoLoginInfo(String id, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id', id);
    pref.setString('password', password);
    pref.setBool('autoLoginPermission', true);
  }

  static getAutoLoginInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString("id");
    String? password = pref.getString("password");
    bool? permission = pref.getBool("autoLoginPermission");
    Map<String, dynamic> autoLoginInfo = {
      'id': email,
      'pw': password,
      "permission": permission
    };

    return autoLoginInfo;
  }

  static deleteAutoLoginInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id', "");
    pref.setString("password", "");
    pref.setBool('autoLoginPermission', false);
    pref.clear();
  }
}