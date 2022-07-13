import 'package:flutter/material.dart';
import 'package:movies_new/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {})
        ], elevation: 0, title: const Text('Latest Movies')),
        body: Stack(children: [
          const Background(),
          SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                //TODO CardSwiper
                CardSwiper(),
                CustomSlider(),
                Text("Home Screen")
              ],
            ),
          ),
        ]));
  }
}
