import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:housy_task/Provider/task.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'snackbar.dart';

Future? addTask(BuildContext context, String taskName,
    String date, bool isDone) {
  User? user = FirebaseAuth.instance.currentUser;
  var TaskProvider = Provider.of<TaskData>(context, listen: false);
  final _firebase = FirebaseFirestore.instance;

  List<Map<String, dynamic>> myData = [
    {
      'taskName': taskName,
      'isDone':isDone,
      
    },
  ];
  print(myData);
    return _firebase.collection(TaskProvider.profile!).doc(user!.uid).update(
      {date: FieldValue.arrayUnion(myData)},
    ).then((value) {
      Navigator.pop(context);

        showSnackBar('Successfully added the task!', context);

    }).catchError((error) =>
        showSnackBar('Failed to add a new task. $error', context));
 
}
