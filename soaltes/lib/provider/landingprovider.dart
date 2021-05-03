import 'package:flutter/foundation.dart';
import 'package:soaltes/model/modellanding.dart';

class LandingProvider with ChangeNotifier{

  int _selected = 0;

  List _landing = ModelLanding().ImageLanding;

  get landing => _landing[_selected];
  get selected => _selected;

  set selected (int value){
    _selected = value;
    notifyListeners();
  }



}