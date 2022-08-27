// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:task_app/screens/detail/detail.dart';
import 'package:task_app/screens/home/home.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final taskList = Task.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: GridView.builder(
        itemCount: taskList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return taskList[index].isLast
              ? _buildAddTask()
              : _buildTask(context, taskList[index]);
        },
      ),
    );
  }

  Widget _buildAddTask() {
    return GestureDetector(
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
      child: DottedBorder(
          dashPattern: [6, 3, 2, 3],
          strokeWidth: 2,
          borderType: BorderType.RRect,
          radius: Radius.circular(20),
          color: Colors.grey.shade400,
          child: Center(
            child: Text(
              "+ Add",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )),
    );
  }

  Widget _buildTask(BuildContext context, Task task) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(task);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: task.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              task.iconData,
              color: task.iconColor,
              size: 30,
            ),
            SizedBox(height: 30),
            Text(
              "${task.title}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildTaskStatus(
                  task.btnColor!,
                  task.iconColor!,
                  "${task.left} left",
                ),
                SizedBox(width: 5),
                _buildTaskStatus(
                  Colors.white,
                  task.iconColor!,
                  "${task.done} done",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatus(Color bgColor, Color textColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
