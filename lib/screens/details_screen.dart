import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              CastingCards()
            ]),
          ),
        ],
      ) 
    );
  }
}

class _CustomAppBar extends StatelessWidget {

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
          padding: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: const Text('movie.title', style: TextStyle(fontSize: 16)),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image:NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text('movie.title',style: textTheme.headlineSmall,overflow: TextOverflow.ellipsis),
              Text('movie.originaltitle',style: textTheme.titleMedium,overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  const Icon(Icons.star_outline,size: 15,color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('movie.voteAverage',style: textTheme.bodySmall)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text('Labore fugiat adipisicing culpa amet incididunt incididunt anim consectetur. Non excepteur in aliquip minim excepteur esse voluptate aute in commodo reprehenderit magna nulla fugiat. Aute ipsum ea pariatur proident commodo consectetur eiusmod irure. Veniam amet qui dolor elit ullamco veniam velit. Duis ipsum cupidatat adipisicing voluptate pariatur commodo laborum. Nostrud sit officia aliqua eiusmod aliquip cillum exercitation sint mollit dolore commodo eu. Enim eu aliqua velit proident ad excepteur officia minim reprehenderit.',
        textAlign: TextAlign.justify,
        style: textTheme.titleMedium),
    );
  }
}