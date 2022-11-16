import 'package:e_commerce_restaurant/services/firebase_services.dart';
import 'package:flutter/material.dart';

main() async {
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //color: Colors.blue,
      home: Container(
        child: Text('test'),
      ),
    );
  }
}
