import 'package:flutter/widgets.dart';

class youtubeplayer extends ChangeNotifier{
  bool isfull=false;

  bool get con => isfull;

   change(bool full){
    isfull = full;
    notifyListeners();
  }

}