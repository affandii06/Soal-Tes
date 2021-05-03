import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soaltes/model/modelproduk.dart';
import 'package:soaltes/service/alert.dart';
import 'package:soaltes/service/savedata.dart';
import 'package:soaltes/view/ui/dashboard/bottomnav.dart';
import 'loadingindicator.dart';

class HitApi {

  Future LoginApi(BuildContext context,String username, String password)async{
    LoadingIndicator().ShowLoading(context);

    final response = await http.post('https://172.104.44.22/api/method/login',
      body: jsonEncode({'usr' : username , 'pwd': password}),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }
    );
    var data = jsonDecode(response.body);
    if(data['message'] == 'Logged In'){
      SaveData().SaveLocalData(response.headers['set-cookie']);
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(context, PageTransition(child: BottomNav(), type: PageTransitionType.rightToLeft), (route) => false);
    }else{
      Navigator.pop(context);
      Alert().AlertFailed(context, 'Login failed, check username or password');
    }
  }
  
  Future getDataProduk()async{
    SharedPreferences getdata = await SharedPreferences.getInstance();
    var cookie = getdata.getString('cookie');
    final response = await http.get('https://172.104.44.22/api/resource/Item?fields=["item_code", "item_name","image","normal_rate","promo_rate"]&filters=[["Item","item_group","=","Products"]]',
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Cookie': cookie
        }
    );
    print(jsonDecode(response.body));
    return produkFromJson(response.body);
  }
  
}