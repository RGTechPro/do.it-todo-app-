import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  AddTask({this.color});
  List<Color>? color;
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String init_val = 'Today';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Task',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Colors.black45),
        leading: Padding(
          padding: const EdgeInsets.all(11.0),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text('What tasks are you planning to perform?',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black54,
                          fontSize: 15)),
                ),
                TextField(
                  style: TextStyle(fontSize: 30),
                  cursorColor: Colors.grey,
                  cursorHeight: 30,
                  autofocus: true,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(
                  height: 35,
                ),
                Divider(
                  color: Colors.grey.withOpacity(.2),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Work',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey.withOpacity(.2),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        alignment: Alignment.centerLeft,
                        value: init_val,
                        //  icon: const Icon(Icons.keyboard_arrow_down),
                        items:
                            <String>['Today', 'Tommorrow'].map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            init_val = newValue!;
                            // Provider.of<Account>(context,listen: false)
                            //     .changeCity(newValue);
                          });
                        }),
                  ],
                ),
                // Spacer(),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
                height: 50,
                width: double.infinity,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: widget.color!,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft))),
          ),
        ],
      ),
    );
  }
}
