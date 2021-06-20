import 'package:flutter/material.dart';
import 'homePage.dart';
// import 'second_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes:{
      //   'a' :(context)=>HomePage(),
      //   '/second':(context)=>SecondPage(),
      // },
        theme: ThemeData(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black87,
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
        home:HomePage()
      // initialRoute: 'a',
    );
  }
}
