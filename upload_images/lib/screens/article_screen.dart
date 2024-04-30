import 'package:flutter/material.dart';
class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});
  //static const routeName = '/article';

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("News"),
    );
  }
}