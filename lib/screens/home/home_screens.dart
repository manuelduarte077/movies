import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route<T>() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

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
          children: [
            CardSwiperWidget(movies: moviesProvider.onDisplayMovies),
            // list of peliculas
            const MovieSliderWidget(
              title: 'Populares',
            ),
            const MovieSliderWidget(
              title: 'Tv populares',
            ),
          ],
        ),
      ),
    );
  }
}
