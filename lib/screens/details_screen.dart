import 'package:flutter/material.dart';

class DetalailsScreen extends StatelessWidget {
  const DetalailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle()
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
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Text('movie.title',style: textTheme.headlineSmall,overflow: TextOverflow.ellipsis),
              Text('movie.originaltitle',style: textTheme.titleMedium,overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star_outline,size: 15,color: Colors.grey),
                  SizedBox(width: 5),
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