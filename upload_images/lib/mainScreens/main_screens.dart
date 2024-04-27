import 'package:flutter/material.dart';
import 'package:upload_images/pages/add_name_page.dart';
import 'package:upload_images/pages/edit_name_page.dart';
import 'package:upload_images/pages/home_page.dart';

class MainScreens extends StatefulWidget 
{
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> 
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeLogin(),
        '/add': (context) => const AddNamePage(),
        '/edit': (context) => const EditNamePage(),  
      },
    );
  }
}
