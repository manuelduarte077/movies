import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

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
            CardSwiperWidget(),

            // list of peliculas
            MovieSliderWidget(
              title: 'Populares',
            ),
            MovieSliderWidget(
              title: 'Tv populares',
            ),
          ],
        ),
      ),
    );
  }
}
