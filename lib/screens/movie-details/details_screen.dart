import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movies});

  static const String routeName = '/details';

  final Movie movies;

  static Route route({required Movie movies}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => DetailsScreen(
        movies: movies,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _CutomAppBar(movie: movies),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(movie: movies),
                _Overview(movie: movies),
                CastingCardWidget(
                  movieId: movies.id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CutomAppBar extends StatelessWidget {
  final Movie movie;

  const _CutomAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black45,
          child: Text(
            movie.title,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
    const ellipsis = TextOverflow.ellipsis;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              movie.fullPosterImg,
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline5),
                  overflow: ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.subtitle1,
                  ),
                  overflow: ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        movie.voteAverage.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Spacer(),
                      const Icon(Icons.date_range, color: Colors.indigo),
                      Text(
                        movie.releaseDate!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style:
            GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
