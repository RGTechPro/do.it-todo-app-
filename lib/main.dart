import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housy_task/Provider/account.dart';
import 'package:housy_task/Provider/task.dart';
import 'package:housy_task/sccreens/home_page.dart';
import 'package:housy_task/sccreens/log_in.dart';
import 'package:housy_task/services/auth_services.dart';
import 'package:provider/provider.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=> Auth()),
        ChangeNotifierProvider(create: (context)=>Account()),
        ChangeNotifierProvider(create: (context)=>TaskData())
      ],
      child: MaterialApp(
        title: 'Do.it',
        theme: ThemeData(
          appBarTheme:const AppBarTheme(
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
        home:(FirebaseAuth.instance.currentUser == null)
            ?  LogIn():HomePage(),
      ),
    );
  }
}
