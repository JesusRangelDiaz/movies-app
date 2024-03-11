import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(movies.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: size.height*0.5,
        child: const Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    
    return SizedBox(
      width: double.infinity,
      height: size.height*.5,
      child: Swiper(
        itemCount:movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*.6,
        itemHeight: size.height*.4,
        itemBuilder: (_, int index) {
          final movie =movies[index];

          movie.heroId =UniqueKey().toString();

          

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments:movie),
            child: Hero(
              tag: '${movie.heroId}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder:  const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}