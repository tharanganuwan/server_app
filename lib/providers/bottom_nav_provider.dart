import 'package:flutter/cupertino.dart';

class BottomNavProvider extends ChangeNotifier {
  //selected bottom nav Index
  int _currentIndex = 0;

  //getter for get selected index
  int get activeIndex => _currentIndex;
  //set selected bottom nav index
  void onItemTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
