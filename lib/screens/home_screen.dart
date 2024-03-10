import 'package:flutter/material.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    

    return  Scaffold(
      appBar:AppBar(
        title: const Center(child: Text('Peliculas en cines',style: TextStyle(color: Colors.white))),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded,color: Colors.white),)
        ],
      ),
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies : moviesProvider.onDisplayMovies),
              MovieSlider(movies : moviesProvider.popularMovies, title: 'Populares',onNextPage: (){moviesProvider.getPopularMovies();},),
            ],
          ),
        )
      )
    );
  }
}