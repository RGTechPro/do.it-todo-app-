import 'package:flutter/material.dart';
import 'package:housy_task/constants/size_config.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * 0.45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(0, .5),
                spreadRadius: .1,
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.grey.withOpacity(.01))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.withOpacity(.15))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.person,
                      color: Color(0xfff65875),
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
            SizedBox(
              height: SizeConfig.screenHeight! * 0.22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text(
                '9 Tasks',
                style: TextStyle(
                    fontFamily: 'Roboto', color: Colors.black54, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Personal',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.025,
            ),
            LinearPercentIndicator(
              trailing: Text(
                '83%',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black54),
              ),
              percent: .83,
              lineHeight: 3,
              backgroundColor: Colors.grey.withOpacity(.2),
              linearGradient: LinearGradient(
                  colors: [Color(0xfff65875), Color(0xfff6ac51)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            )
          ],
        ),
      ),
    );
  }
}
