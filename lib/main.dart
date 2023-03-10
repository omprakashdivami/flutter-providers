import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens/provider.dart';
import 'package:providers/screens/selected.dart';
import 'package:providers/screens/wholedata.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create:((context) => Providers() ),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Wholedata(),
      initialRoute: '/wholedata',
      routes:{
        '/wholedata':(context) => Wholedata(),
        '/selected':(context) => Selected()
      },
    );
  }
}
