// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String, dynamic> detail;
  const TaskTimeLine({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeLine(detail["tlColor"]),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detail["time"]),
                detail["title"].isNotEmpty
                    ? _buildCard(
                        detail["bgColor"], detail["title"], detail["slot"])
                    : _buildCard(Colors.white, "", ""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // this widget is for creating vertical timeline
  Widget _buildTimeLine(Color color) {
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: color),
            ),
          ),
        ),
        afterLineStyle: LineStyle(thickness: 2, color: color),
      ),
    );
  }

  // this widget is for creating activities card
  Widget _buildCard(Color bgColor, String title, String slot) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            slot,
            style: TextStyle(
              color: Colors.tealAccent[700],
            ),
          ),
        ],
      ),
    );
  }
}
