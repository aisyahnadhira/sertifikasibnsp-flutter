import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/login.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
 );
 }
}