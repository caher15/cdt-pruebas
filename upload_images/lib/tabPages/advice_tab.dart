import 'package:flutter/material.dart';

class AdviceTabPage extends StatefulWidget {
  const AdviceTabPage({super.key});

  @override
  State<AdviceTabPage> createState() => _AdviceTabPageState();
}

class _AdviceTabPageState extends State<AdviceTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Advice"),
    );
  }
}