import 'package:flutter/material.dart';
import 'package:movie_app_assignment/application/app_router.dart';
import 'package:movie_app_assignment/presentation/provider.dart';
import 'package:movie_app_assignment/presentation/shared_widgets/movies_screen_shimmer_widget.dart';
import 'package:provider/provider.dart';

import '../shared_widgets/movie_item_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    super.key,
  });

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MovieProvider _movieProvider;
  final ScrollController _scrollController = ScrollController();
  int _skip = 1;
  //call only once
  @override
  void initState() {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.getMoviesData(page: _skip);

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        _skip = _skip + 1;

        print(_skip);
        _movieProvider.getMoviesData(
          page: _skip,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Movies'),
          // actions: [] cann add actionable widgets in app bar,
        ),
        bottomNavigationBar: NavigationBar(destinations: [
          IconButton(onPressed: () {}, icon: Icon(Icons.contact_mail)),
          IconButton(onPressed: () {}, icon: Icon(Icons.star)),
          IconButton(onPressed: () {}, icon: Icon(Icons.file_copy))
        ]),
        body: SizedBox(
          // height: 200,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: SizedBox(
                    height: 150,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              //BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/flowers.jpeg'))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dummy data",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text("Dummy data",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )

        //  Container(
        //   padding: const EdgeInsets.symmetric(vertical: 8),
        //   child:
        //       Consumer<MovieProvider>(builder: (context, moviesProvider, child) {
        //     return moviesProvider.movies.isNotEmpty
        //         ? ListView.builder(
        //             controller: _scrollController,
        //             shrinkWrap: true,
        //             physics:
        //                 const BouncingScrollPhysics(), //to make list  srollable
        //             itemCount: moviesProvider.movies.length,
        //             itemBuilder: (context, index) {
        //               return MovieItem(
        //                 onTap: () {
        //                   Navigator.pushNamed(context, RouteName.movieDetails,
        //                       arguments: moviesProvider.movies[index]);
        //                 },
        //                 movieModel: moviesProvider.movies[index],
        //               ); // Widget to display movie information
        //             },
        //           )
        //         : ShimmerEffect();
        //   }),
        // ),

        );
  }
}
