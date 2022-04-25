import 'package:bangladesh_drip/src/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/views/home_page.dart';

void main() {
  // For disabling landscape view
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bangladesh Drip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const HomePage(),
      //home: const LoginPage(),
    );
  }
}
