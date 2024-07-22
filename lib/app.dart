import 'package:flutter/material.dart';
import 'views/user_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM with Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserView(),
    );
  }
}
