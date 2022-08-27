import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool isLast;
  List<Map<String, dynamic>>? desc;

  Task({
    this.bgColor,
    this.btnColor,
    this.done,
    this.iconColor,
    this.iconData,
    this.isLast = false,
    this.left,
    this.title,
    this.desc,
  });

  static List<Task> generateTasks() {
    return [
      Task(
        iconData: Icons.person_rounded,
        title: "Personal",
        bgColor: kYellowLight,
        iconColor: kYellowDark,
        btnColor: kYellow,
        left: 3,
        done: 1,
        desc: [
          {
            "title": "Go for a walk with dog",
            "time": "9:00 am",
            "slot": "9:00 - 10:00 am",
            "tlColor": kRedDark,
            "bgColor": kRedLight,
          },
          {
            "title": "Shot on dribble",
            "time": "10:00 am",
            "slot": "10:00 - 13:00 am",
            "tlColor": kBlueDark,
            "bgColor": kBlueLight,
          },
          {
            "title": "",
            "time": "",
            "slot": "",
            "tlColor": kBlueDark,
            "bgColor": kBlueLight,
          },
          {
            "title": "",
            "time": "",
            "slot": "",
            "tlColor": kBlueDark,
            "bgColor": kBlueLight,
          },
          {
            "title": "Relaxing",
            "time": "13:00 am",
            "slot": "13:00 - 15:00 am",
            "tlColor": Colors.amber.shade300,
            "bgColor": Colors.amber.shade200,
          },
        ],
      ),
      Task(
        iconData: Icons.cases_rounded,
        title: "Work",
        bgColor: kRedLight,
        iconColor: kRedDark,
        btnColor: kRed,
        left: 2,
        done: 0,
      ),
      Task(
        iconData: Icons.favorite,
        title: "Health",
        bgColor: kBlueLight,
        iconColor: kBlueDark,
        btnColor: kBlue,
        left: 1,
        done: 1,
      ),
      Task(
        isLast: true,
      ),
    ];
  }
}
