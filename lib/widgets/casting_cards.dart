import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class CastingCards extends StatelessWidget {
  
  final int movieId;
  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId), 
      builder:(_, AsyncSnapshot<List<Cast>> snapshot) {
        if(!snapshot.hasData){
          return  Container(
            constraints: const BoxConstraints(maxWidth: 300),
            height: 180,
            child: const CupertinoActivityIndicator(),

          );
        }

      final List<Cast> cast = snapshot.data!;
      return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        itemCount: cast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => _CastCard(actor: cast[index]),
      ),
    );
    },);
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullProfilePath),
              width: 100,
              height: 135,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
