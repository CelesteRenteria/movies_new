import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_id_provider.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:movies_new/widgets/widgets.dart';

import 'home_screen.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    final ElId = Provider.of<MovieID>(context, listen: true);
    print(moviesProvider.similarMovies);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        appBar: AppBar(
          backgroundColor: Colors.white60,
          elevation: 0,
          toolbarHeight: 75,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.grey[850],
          ),
          title: Text(("Similar Movies").toString(),
              style: TextStyle(color: Colors.grey.shade900)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SimilarMovies(movies: moviesProvider.similarMovies)
        ])));
  }
}
