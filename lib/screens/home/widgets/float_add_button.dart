// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/screens/home/home.dart';

class MyFloatButton extends StatelessWidget {
  const MyFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.add,
        size: 35,
      ),
    );
  }
}
