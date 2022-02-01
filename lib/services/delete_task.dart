import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:housy_task/Provider/task.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'snackbar.dart';

Future? deleteTask(
    BuildContext Dcontext, String taskName, String date, bool isDone) {
  User? user = FirebaseAuth.instance.currentUser;
  var TaskProvider = Provider.of<TaskData>(Dcontext, listen: false);
  final _firebase = FirebaseFirestore.instance;

  List<Map<String, dynamic>> myData = [
    {
      'taskName': taskName,
      'isDone': isDone,
    },
  ];
  print(myData);
   FirebaseFirestore.instance
      .collection(TaskProvider.profile!)
      .doc(user!.uid)
      .update({date: FieldValue.arrayRemove(myData)})
      .then((value) => showSnackBar('Deleted Successfully!', Dcontext))
      .catchError(
          (error) => showSnackBar('Failed to delete task. $error', Dcontext));
}
