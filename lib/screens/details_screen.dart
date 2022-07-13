import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (appBar: AppBar(
      elevation: 0,
      title: Text('Details Screen'),
    ),
      body: Center(
      child: Text('Details Screen')
      )
    );
  }
}