// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyPopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const MyPopUpMenu({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.amber[200],
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
