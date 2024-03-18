import 'package:flutter/material.dart';

import 'package:movie_app_assignment/application/app_router.dart';
import 'package:movie_app_assignment/data/model/movie_model.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movieModel;
  final Function()? onTap;
  const MovieItem({
    required this.onTap,
    required this.movieModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          child: ListTile(
            title: Text(movieModel.Title),
            leading: ClipRRect(
              borderRadius:
                  BorderRadius.circular(6.0), //to make image corner rounded
              child: Hero(
                tag: movieModel.imdbID.toString(),
                child: FadeInImage.assetNetwork(
                  width: 50,
                  placeholder:
                      'assets/placeholder_image.png', // Placeholder image
                  image: movieModel.Poster,
                  fit: BoxFit.cover, //Fill the entire space of the widget
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
