import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    print(moviesProvider.dataMovies);

    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {})
        ], elevation: 0, title: const Text('Latest Movies')),
        body: Stack(children: [
          const Background(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //TODO CardSwiper
                CardSwiper(movies: moviesProvider.dataMovies),
                CustomSlider(),
                Text("Home Screen")
              ],
            ),
          ),
        ]));
  }
}
