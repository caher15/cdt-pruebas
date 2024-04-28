import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upload_images/firebase_options.dart';
import 'package:upload_images/splashScreen/splash_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );

  runApp(MyApp(
    child: MaterialApp(
      title: 'CDT app',
      theme: ThemeData(primaryColor: Colors.blue, textSelectionTheme: TextSelectionThemeData( selectionColor: Colors.blue.shade300),),
      home: const MySplashScreen(),
      debugShowCheckedModeBanner: false,

    )
  ));
}
class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});
  
  static void restartApp(BuildContext context){
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }
  

  @override
  State<MyApp> createState() => _MyAppState();


}
class _MyAppState extends State<MyApp> {
  
  Key key = UniqueKey();
  void restartApp(){
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
      
      );
  }
}

