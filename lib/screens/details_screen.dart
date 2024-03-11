import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:movies_app/models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(title: movie.title, backdropImg: movie.fullBackdropPath),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie:movie),
              _Overview(overview: movie.overview),
              CastingCards(movieId: movie.id)
            ]),
          ),
        ],
      ) 
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String title;
  final String backdropImg;

  const _CustomAppBar({required this.title, required this.backdropImg});


  @override
  Widget build(BuildContext context){
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
          width: double.infinity,
          child:  Text(title, style: const TextStyle(fontSize: 16),textAlign: TextAlign.center,),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image:NetworkImage(backdropImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({ required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'), 
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints:BoxConstraints(maxWidth: size.width-190),
            child: Column(
              children: [
                Text(movie.title,style: textTheme.headlineSmall,overflow: TextOverflow.ellipsis, maxLines: 2,textAlign: TextAlign.center),
                Text(movie.originalTitle,style: textTheme.titleMedium,overflow: TextOverflow.ellipsis,maxLines: 2),
                Row(
                  children: [
                    const Icon(Icons.star_outline,size: 15,color: Colors.grey,),
                    const SizedBox(width: 5),
                    Text('${movie.voteAverage}',style: textTheme.bodySmall)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;

  const _Overview({required this.overview});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(overview,
        textAlign: TextAlign.justify,
        style: textTheme.titleMedium),
    );
  }
}