import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> movies;
  const CardSwiper({
    Key? key,
    required this.movies
    }
    ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const base ="https://image.tmdb.org/t/p/w500";
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4, //40%
        itemWidth: size.width * 0.6, //60%
        itemBuilder: (_, int index) {
          //hace como si fuera un for
          final movie = movies[index];
          final imageURL = base + movie["poster_path"];
          return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: 'args'),
              child:  ClipRRect(
                //child: Expanded(
                child: FadeInImage(
                    placeholder: const AssetImage('assets/placeholder.png'),
                    image: NetworkImage(imageURL),
                    fit: BoxFit.cover),
                //)
              ));
        },
      ),
    );
  }
}
