import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:housy_task/Provider/task.dart';
import 'package:housy_task/model/task.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'snackbar.dart';

Future? editTask( BuildContext context, String taskName, String date, bool isDone,bool newDone) {
 User? user = FirebaseAuth.instance.currentUser;
  var TaskProvider = Provider.of<TaskData>(context, listen: false);
  final _firebase = FirebaseFirestore.instance;

   List<Map<String, dynamic>> myData = [
    {
      'taskName': taskName,
      'isDone': newDone,
    },
  ];
  
  print(myData);

    
    List<Map<String, dynamic>> val = [
      {
        'taskName': taskName,
      'isDone': isDone,
      }
    ];

  
      _firebase
          .collection(TaskProvider.profile!)
          .doc(user!.uid)
          .update({date: FieldValue.arrayRemove(val)}).then((value) {
       
      }).catchError((error) =>
              showSnackBar('Failed !. $error', context));
     


    return _firebase.collection(TaskProvider.profile!).doc(user.uid).update(
      {date: FieldValue.arrayUnion(myData)},
    ).then((value) {
      
    
  
        
    }).catchError((error) =>
        showSnackBar('Failed!. $error', context));

}
