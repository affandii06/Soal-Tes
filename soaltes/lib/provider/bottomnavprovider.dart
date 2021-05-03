import 'package:flutter/foundation.dart';
import 'package:soaltes/view/ui/dashboard/home.dart';
import 'package:soaltes/view/ui/dashboard/message.dart';
import 'package:soaltes/view/ui/dashboard/notif.dart';
import 'package:soaltes/view/ui/dashboard/profile.dart';
import 'package:flutter/material.dart';

class BottomnavProvider with ChangeNotifier{

  int _selected = 0;

  Color color1 = Colors.lightBlue;
  Color color2 = Colors.black54;
  Color color3 = Colors.black54;
  Color color4 = Colors.black54;

  List _page = [
    Home(),
    Message(),
    Notif(),
    Profile(),
  ];

  get page => _page[_selected];
  get selected => _selected;
  set selected(int value){
    _selected = value;

    color1 = Colors.black54;
    color2 = Colors.black54;
    color3 = Colors.black54;
    color4 = Colors.black54;

    if(_selected == 0){
      color1 = Colors.lightBlue;
      notifyListeners();
    }
    if(_selected == 1){
      color2 = Colors.lightBlue;
      notifyListeners();
    }
    if(_selected == 2){
      color3 = Colors.lightBlue;
      notifyListeners();
    }
    if(_selected == 3){
      color4 = Colors.lightBlue;
      notifyListeners();
    }

    notifyListeners();
  }

}