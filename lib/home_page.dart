import 'package:flutter/material.dart';
import 'package:housy/widgets/appbar.dart';
import 'package:housy/widgets/project.dart';
import 'package:housy/widgets/task.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController s = ScrollController();
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(200),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
            child: child!,
            data: ThemeData.dark().copyWith(
              primaryColor: Theme.of(context).primaryColor,
              accentColor: Theme.of(context).accentColor,
            ));
      },
    );

    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(),
        drawer: Drawer(),
        body: ListView(
            controller: s,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1.1,
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("My Tasks",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(Icons.calendar_today,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    _MyTasks(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Active Projects",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Expanded(child: _MyProjects(s: s))
                  ],
                ),
              ),
            ]));
  }
}

class _MyTasks extends StatelessWidget {
  _MyTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Task(
              color: Colors.redAccent,
              task: TaskModel(
                  started: 12, tasksnow: 10, title: "Todo", icon: Icons.alarm)),
          Task(
              color: Colors.yellow,
              task: TaskModel(
                  started: 12,
                  tasksnow: 10,
                  title: "Progress",
                  icon: Icons.play_arrow)),
          Task(
              color: Theme.of(context).primaryColor,
              task: TaskModel(
                  started: 12, tasksnow: 10, title: "Done", icon: Icons.done)),
        ],
      ),
    );
  }
}

class _MyProjects extends StatelessWidget {
  ScrollController s;
  _MyProjects({Key? key, required this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          controller: s,
          crossAxisSpacing: 30,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          children: [
            Project(
              color: Colors.blueAccent,
              project: ProjectModel(
                  title: "Medical App", hours: "5", percent: 65 / 100),
            ),
            Project(
              color: Colors.redAccent,
              project: ProjectModel(
                  title: "Social Media App", hours: "8", percent: 95 / 100),
            ),
            Project(
              color: Colors.purpleAccent,
              project: ProjectModel(
                  title: "E-Commerce App", hours: "15", percent: 45 / 100),
            ),
            Project(
              color: Colors.greenAccent,
              project: ProjectModel(
                  title: "BlockChain App", hours: "25", percent: 85 / 100),
            ),
          ],
        ));
  }
}
