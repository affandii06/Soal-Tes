import 'package:flutter/foundation.dart';

class ShowHideProvider with ChangeNotifier{

  bool _showhide = true;

  get showhide =>_showhide;
  set showhide(bool value){
    _showhide = value;
    notifyListeners();
  }

}