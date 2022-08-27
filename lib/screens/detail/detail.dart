// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/detail/widgets/date_picker.dart';
import 'package:task_app/screens/detail/widgets/task_timeline.dart';
import 'package:task_app/screens/detail/widgets/task_title.dart';
import 'package:task_app/screens/home/home.dart';
import 'package:task_app/screens/home/widgets/float_add_button.dart';
import 'package:task_app/screens/home/widgets/popup_3dot.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DatePicker(),
                  TaskTitle(),
                ],
              ),
            ),
          ),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "No Task available for today",
                        style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => TaskTimeLine(detail: detailList[index]),
                    childCount: detailList.length,
                  ),
                ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
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
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
        child: BottomNavigationBar(
          elevation: 0,
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
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    // we use SliverAppBar for animated appBar
    return SliverAppBar(
      floating: true,
      expandedHeight: 100,
      backgroundColor: Color(0xFF1C1D21),
      // we use leading for arrow_back icon
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back),
        iconSize: 25,
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
            color: Colors.white,
            size: 33,
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${task.title} tasks",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "You have ${task.left} tasks for today!",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
