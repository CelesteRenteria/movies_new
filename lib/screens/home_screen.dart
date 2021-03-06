import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    //print(moviesProvider.dataMovies);

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
          title: Text("Latest Movies", style: TextStyle(color: Colors.grey.shade900)),
          centerTitle: true,
        ),
        body: Stack(children: [
           SingleChildScrollView
           (
             child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //TODO CardSwiper
                  CardSwiper(movies: moviesProvider.dataMovies),
                ],
              ),
           ),
          
        ]));
  }
}
