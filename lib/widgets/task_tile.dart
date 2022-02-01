import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: (checkedValue)
          ? GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.black45,
              ),
            )
          : null,
      contentPadding: EdgeInsets.all(0),
      visualDensity: VisualDensity(horizontal: -4, vertical: -2),
      title: Text(
        'Meeting 4pm',
        style: TextStyle(
            decoration: (checkedValue)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontFamily: 'Roboto',
            color: Colors.black54,
            fontSize: 17),
      ),
      leading: Checkbox(
        fillColor: MaterialStateProperty.all(Colors.black45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        visualDensity: VisualDensity(horizontal: -4),
        value: checkedValue,
        onChanged: (a) {
          setState(() {
            (!checkedValue) ? checkedValue = true : checkedValue = false;
          });
        },
      ),
    );
  }
}
