import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Text(
            'New Task',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        )),
        iconTheme: IconThemeData(color: Colors.black45),
        leading: Padding(
          padding: const EdgeInsets.all(11.0),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(),
    );
  }
}
