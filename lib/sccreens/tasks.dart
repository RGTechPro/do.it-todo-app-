import 'package:flutter/material.dart';
import 'package:housy_task/sccreens/add_task.dart';
import 'package:housy_task/widgets/task_tile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Color> GColors = [Color(0xff62aee9), Color(0xff5363e2)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add,
              size: 40,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: GColors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft))),
        onPressed: () {},
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black45),
        actions: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTask()));
              },
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.withOpacity(.15))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.work_rounded,
                    color: Color(0xff627fd0),
                  ),
                ),
              ),
            ),
            Text(
              '9 Tasks',
              style: TextStyle(
                  fontFamily: 'Roboto', color: Colors.black54, fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Work',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: LinearPercentIndicator(
                padding: EdgeInsets.only(right: 10),
                trailing: Text(
                  '36%',
                  style: TextStyle(fontFamily: 'Roboto', color: Colors.black54),
                ),
                percent: .36,
                lineHeight: 3,
                backgroundColor: Colors.grey.withOpacity(.2),
                linearGradient: LinearGradient(
                    colors: [Color(0xff5363e2), Color(0xff62aee9)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
            ),
            Text(
              'Today',
              style: TextStyle(
                  fontFamily: 'Roboto', color: Colors.black54, fontSize: 17),
            ),
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [TaskTile(), TaskTile()],
            ),
          ],
        ),
      ),
    );
  }
}
