// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_app/screens/home/widgets/float_add_button.dart';
import 'package:task_app/screens/home/widgets/go_premium.dart';
import 'package:task_app/screens/home/widgets/popup_3dot.dart';
import 'package:task_app/screens/home/widgets/tasks_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),

      body: Column(
        children: [
          GoPremium(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tasks",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Tasks(),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      // bellow is for bottom navigation bar
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bellow is for red FloatButton in the middle
      floatingActionButton: MyFloatButton(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // elevation: 0 because we don't need any shadow for appBar
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/mahdi.jpg"),
            ),
          ),
          SizedBox(width: 20),
          Container(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline4,
                children: [
                  TextSpan(
                    text: "Hi, ",
                    style: TextStyle(
                      fontFamily: "DynaPuff",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "mahdi",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "DynaPuff",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        MyPopUpMenu(
          menuList: [
            PopupMenuItem(
              height: 5,
              padding: EdgeInsets.all(0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    "My Profile",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              height: 5,
              padding: EdgeInsets.all(0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              child: Center(
                child: Text("About us"),
              ),
            ),
            PopupMenuItem(
              height: 5,
              padding: EdgeInsets.all(0),
              child: ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Log out",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 33,
          ),
        )
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "Person",
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
