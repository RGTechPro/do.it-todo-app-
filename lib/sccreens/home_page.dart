import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:housy_task/constants/size_config.dart';
import 'package:housy_task/widgets/card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:housy_task/Provider/account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = new DateTime.now();
  List<Color> GColors = [Color(0xfff6ac51), Color(0xfff65875)];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: GColors,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Text(
              'TODO',
              style:
                  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
            ),
          )),
          leading: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(11.0),
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.alignLeft),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          }),
          actions: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 12,
                            color: Colors.black38,
                            spreadRadius: 0)
                      ],
                    ),
                    child: CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'images/avatar.jpg',
                            height: 60,
                            width: 60,
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Hello, ${FirebaseAuth.instance.currentUser!.displayName}.',
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Looks like feel good.\nYou have 3 tasks to do today.',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white.withOpacity(.75),
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    DateFormat.yMMMMd('en_US').format(now),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                height: SizeConfig.screenHeight! * 0.5,
                child: PageView(
                    controller: PageController(viewportFraction: 0.75),
                    onPageChanged: (int i) {
                      setState(() {
                        if (i == 1) {
                          GColors = [Color(0xff62aee9), Color(0xff5363e2)];
                        } else if (i == 2) {
                          GColors = [Color(0xff4cc1a9), Color(0xff378e7c)];
                        } else {
                          GColors = [Color(0xfff6ac51), Color(0xfff65875)];
                        }
                      });
                    },
                    //shrinkWrap: true,
                    //  physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      TaskCard(
                        profile: 'Personal',
                        icon: Icons.person,
                        color: [Color(0xfff6ac51), Color(0xfff65875)],
                      ),
                      TaskCard(
                        profile: 'Work',
                        icon: Icons.work,
                        color: [Color(0xff62aee9), Color(0xff5363e2)],
                      ),
                      TaskCard(
                        profile: 'Home',
                        icon: Icons.home,
                        color: [Color(0xff4cc1a9), Color(0xff378e7c)],
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
