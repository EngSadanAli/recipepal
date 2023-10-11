import 'package:flutter/foundation.dart';

class StateProvider extends ChangeNotifier{

  bool passwordVisible = true;
  bool passwordVisible1 = true;
  bool passwordVisible2 = true;
// Password Visiviltiy
 void paswordVis(){
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
  void paswordVis1(){
    passwordVisible1 = !passwordVisible1;
    notifyListeners();
  }
  void paswordVis2(){
    passwordVisible2 = !passwordVisible2;
    notifyListeners();
  }


}