import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xfff6ac51), Color(0xfff65875)],
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
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 12, color: Colors.black38, spreadRadius: 0)
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
                'Hello, Jane.',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35),
              )
            ],
          ),
        ),
      ),
    );
  }
}
