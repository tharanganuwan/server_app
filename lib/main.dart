import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:server_app/providers/bottom_nav_provider.dart';
import 'package:server_app/providers/record_provider.dart';
import 'package:server_app/providers/server_provider.dart';
import 'package:server_app/screens/home_screen.dart';
import 'package:server_app/screens/main_screen.dart';
import 'package:server_app/screens/records_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => BottomNavProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ServerProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => RecordProvider(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ServerApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
