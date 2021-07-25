import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectModel {
  double percent;
  String title;
  String hours;

  ProjectModel(
      {required this.hours, required this.title, required this.percent});
}

class Project extends StatelessWidget {
  Color color;
  ProjectModel project;
  Project({Key? key, required this.color, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)), color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
              backgroundColor: Colors.transparent,
              radius: 100,
              animationDuration: 500,
              progressColor: Colors.white,
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              percent: project.percent,
              center: Text((project.percent * 100).toString() + "%")),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(project.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(project.hours + " hours progress",
                  style: TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
