import 'package:shared_preferences/shared_preferences.dart';

class SaveData {

  SaveLocalData(var cookie)async{
    SharedPreferences savelocal = await SharedPreferences.getInstance();
    savelocal.setString('cookie', cookie);
  }

}