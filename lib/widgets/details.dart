import 'package:flutter/material.dart';
import 'package:movies_new/providers/movies_id_provider.dart';
import 'package:movies_new/providers/movies_provider.dart';
import 'package:movies_new/screens/information_screen.dart';
import 'package:movies_new/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  final List<dynamic> movies;
  final movieId;
  const Details({Key? key, required this.movies, required this.movieId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ElId = Provider.of<MovieID>(context);
    final movie = movies[movieId];
    final prueba = movie["id"];
    print(prueba);
    const base = "https://image.tmdb.org/t/p/w500";
    final imageURL = base + movie["poster_path"];
    Size size = MediaQuery.of(context).size;
    final List<String> headers = <String>['Release Date', 'Vote Average','Votes','Popularity'];
    final List<dynamic> info = <dynamic>[movie["release_date"], movie["vote_average"], movie["vote_count"], movie["popularity"]];

    return Column(children: [
      Container(
        height: size.height * 0.75 - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          boxShadow: [BoxShadow(offset: Offset(0, 5), blurRadius: 50)],
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageURL)),
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 350,
                  child: Text(
                    movie["original_title"],
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Color.fromRGBO(154, 155, 178, 1),
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            )),
                                    onPressed: () {
                                      ElId.movieidS = movie["id"];
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>  InformationScreen()));
                                        },
                                    child: const Text('Similar Movies')),
                                    const Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Color(0xFF9A9BB2),
                      size: 15.0,
                    )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: const LeftAlingTitle(title: 'Story')),
          SizedBox(
              width: 500,
              child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    movie["overview"],
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: const LeftAlingTitle(title: 'Information')),
          Card(
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children:[ SizedBox(
                                      width: 400,
                                      height: 250,
                                      child: ListView.separated(
                                        itemCount: headers.length,
                                        itemBuilder:
                                            (BuildContext  context, int index) {
                                          return Container(
                                              height: 40,
                                              child: Column(
                                                children: <Widget>[
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text( '${headers[index]}',style: TextStyle(color:Color(0xFF9A9BB2), fontSize: 13, fontWeight: FontWeight.w500))),
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text( '${info[index]}',style: TextStyle(color:Colors.black, fontSize: 13, fontWeight: FontWeight.w700)))
                                                ],
                                              ));
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Divider(),
                                      )),
                ]
              ),
            ),
          ),
        
        ],
      ),
    ]);
  }
}
