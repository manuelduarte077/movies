import 'package:flutter/material.dart';

import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const CircleAvatarWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // TODO:  CardSwiper widget here
            CardSwiperWidget(),

            // list of peliculas
            MovieSliderWidget(),
          ],
        ),
      ),
    );
  }
}
