import 'package:flutter/material.dart';
import 'package:upload_images/global/global.dart';
import 'package:upload_images/splashScreen/splash_screen.dart';

class AdviceTabPage extends StatefulWidget {
  const AdviceTabPage({super.key});

  @override
  State<AdviceTabPage> createState() => _AdviceTabPageState();
}

class _AdviceTabPageState extends State<AdviceTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child:  const Text("Sign Out"),
        onPressed: () {
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute
      (
        builder: (c)=> const MySplashScreen()));
      },
        ),
        
    );
  }
}