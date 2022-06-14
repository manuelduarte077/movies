import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String routeName = 'details';

  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const DetailsScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar por una instancia de la clase
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CutomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const _PosterAndTitle(),
                const _Overview(),
                const _Overview(),
                const _Overview(),
                const _Overview(),
                const CastingCardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CutomAppBar extends StatelessWidget {
  const _CutomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black45,
          child: const Text(
            'movie.title',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/200/300/?random'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const ellipsis = TextOverflow.ellipsis;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://picsum.photos/200/300/?random',
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',
                  style: textTheme.headline6, overflow: ellipsis),
              Text('movie.originalTitle',
                  style: textTheme.headline6, overflow: ellipsis),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  Text('movie.voteAverage',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Commodo magna ex ut irure nisi incididunt ea aliquip et. Amet quis ipsum minim culpa adipisicing non. Eiusmod tempor ea irure dolore est. Irure mollit id velit elit fugiat. Mollit deserunt irure magna excepteur sint fugiat sit. Ea labore fugiat enim eiusmod. Voluptate voluptate aliquip officia sunt mollit labore ut ad culpa do ex elit nisi commodo. Enim et commodo proident ex anim do reprehenderit proident.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
