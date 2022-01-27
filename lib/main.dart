import 'package:flutter/material.dart';
import 'package:testproject/provider.dart';
import 'package:testproject/views/home_page.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Demo App',
        home: HomePage(),
      ),
    );
  }
}
