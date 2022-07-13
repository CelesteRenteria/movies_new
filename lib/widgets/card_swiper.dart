import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4, //40%
        itemWidth: size.width * 0.6, //60%
        itemBuilder: (_, int index) {
          return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: 'args'),
              child: const ClipRRect(
                //child: Expanded(
                child: FadeInImage(
                    placeholder: AssetImage('assets/placeholder.png'),
                    image: AssetImage('assets/cats.jpg'),
                    fit: BoxFit.cover),
                //)
              ));
        },
      ),
    );
  }
}
