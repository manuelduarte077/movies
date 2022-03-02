import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-$index'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
