import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housy_task/Provider/task.dart';
import 'package:housy_task/constants/size_config.dart';
import 'package:housy_task/sccreens/tasks.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  String? profile;
  IconData? icon;
  int? task_done;
  int? total_task;
  List<Color>? color;
  TaskCard(
      {this.profile, this.icon, this.task_done, this.total_task, this.color});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 15, left: 2, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Provider.of<TaskData>(context, listen: false).profile = profile;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Task(
                        profile: profile,
                        icon: icon,
                        color: color,
                      )));
        },
        child: Container(
          height: SizeConfig.screenHeight! * 0.46,
          width: SizeConfig.screenWidth! * 0.7,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset.zero,
                    spreadRadius: 0,
                    blurRadius: 13),
              ],
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.grey.withOpacity(.01))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.15))),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                icon,
                                color: color!.first,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.22,
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(profile!)
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      try {
                        final now = new DateTime.now();
                        String date = DateFormat.yMMMMd('en_US').format(now);
                        List tempDoc = snapshot.data![date];
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                            'Something went wrong',
                          ));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (tempDoc.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 3),
                            child: Text(
                              '0 Task today',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black54,
                                  fontSize: 17),
                            ),
                          );
                        }

                        Provider.of<TaskData>(context).len = tempDoc.length;

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: Text(
                            '${Provider.of<TaskData>(context).len} Tasks',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black54,
                                fontSize: 17),
                          ),
                        );
                      } catch (e) {
                        if (e.toString().contains('field does not exist') ||
                            e.toString().contains('cannot get a field')) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 3),
                            child: Text(
                              '0 Task today',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black54,
                                  fontSize: 17),
                            ),
                          );
                        }
                        return Center(
                            child: Text(
                          'Error: $e',
                          textAlign: TextAlign.center,
                        ));
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    profile!,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.020,
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(profile!)
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      try {
                        final now = new DateTime.now();
                        String date = DateFormat.yMMMMd('en_US').format(now);
                        List tempDoc = snapshot.data![date];

                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                            'Something went wrong',
                          ));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (tempDoc.isEmpty) {
                          return LinearPercentIndicator(
                            //  padding: EdgeInsets.only(right: 10),
                            trailing: Text(
                              '0%',
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black54),
                            ),
                            percent: 0,
                            lineHeight: 3,
                            backgroundColor: Colors.grey.withOpacity(.2),
                            linearGradient: LinearGradient(
                                colors: color!,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                          );
                        }

                        Provider.of<TaskData>(context).len = tempDoc.length;
                        Provider.of<TaskData>(context).n = 0;
                        for (int i = 0;
                            i <
                                Provider.of<TaskData>(context, listen: false)
                                    .len;
                            i++) {
                          if (tempDoc[i]['isDone'] == true) {
                            Provider.of<TaskData>(context).n++;
                          }
                        }

                        return LinearPercentIndicator(
                          trailing: Text(
                            '${(Provider.of<TaskData>(context).n / Provider.of<TaskData>(context).len * 100).toStringAsFixed(2)}%',
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Colors.black54),
                          ),
                          percent: Provider.of<TaskData>(context).n /
                              Provider.of<TaskData>(context).len,
                          lineHeight: 3,
                          backgroundColor: Colors.grey.withOpacity(.2),
                          linearGradient: LinearGradient(
                              colors: color!,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                        );
                      } catch (e) {
                        if (e.toString().contains('field does not exist') ||
                            e.toString().contains('cannot get a field')) {
                          return LinearPercentIndicator(
                            // padding: EdgeInsets.only(right: 10),
                            trailing: Text(
                              '0%',
                              style: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black54),
                            ),
                            percent: 0,
                            lineHeight: 3,
                            backgroundColor: Colors.grey.withOpacity(.2),
                            linearGradient: LinearGradient(
                                colors: color!,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                          );
                        }
                        return Center(
                            child: Text(
                          'Error: $e',
                          textAlign: TextAlign.center,
                        ));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
