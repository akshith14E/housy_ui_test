import 'package:flutter/material.dart';

class TaskModel {
  String title;
  int tasksnow;
  int started;
  IconData icon;
  TaskModel(
      {required this.title,
      required this.tasksnow,
      required this.started,
      required this.icon});
}

class Task extends StatelessWidget {
  Color color;
  TaskModel task;
  Task({Key? key, required this.color, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      height: 70,
      color: Color(0xff242526),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            height: 45,
            width: 45,
            decoration:
                BoxDecoration(color: this.color, shape: BoxShape.circle),
            child: Icon(task.icon),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                task.started.toString() +
                    ' started, ' +
                    task.tasksnow.toString() +
                    ' tasks now',
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
