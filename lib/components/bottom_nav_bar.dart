import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavigationBar({ void Function(int)? togglePages,required int currentIndex}) {
  return BottomNavigationBar(
      selectedItemColor: Colors.white,
      selectedFontSize: 16,
      selectedIconTheme: const IconThemeData(size: 35),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.grey.shade400,
      unselectedFontSize: 10,
      backgroundColor: Colors.indigo,
      currentIndex: currentIndex,
      onTap: togglePages,
      //type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home,), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill), label: "Task"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.lightbulb), label: "Quiz"),
      ]);
}