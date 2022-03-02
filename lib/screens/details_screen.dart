import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar por una instancia de la clase
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CutomAppBar(),
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
