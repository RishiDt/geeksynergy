import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/movie_model.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';
import 'package:flutter_application_1/ui/ui_utils/show_toast.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // First part: up and down arrow icon buttons and vote count
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  // Handle upvote
                  showAlignedToast(
                      'You Pressed Up-Vote', Alignment.bottomCenter, context);
                },
              ),
              Text(
                '${movie.voting}',
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () {
                  // Handle downvote
                  showAlignedToast(
                      'You Pressed down-Vote', Alignment.bottomCenter, context);
                },
              ),
            ],
          ),
          // Second part: movie poster image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: UiColors.primaryColor,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
                // BoxShadow(
                //   color: UiColors.primaryColor,
                //   blurRadius: 20.0,
                //   spreadRadius: 5.0,
                // ),
              ],
            ),
            child: Image.network(
              movie.poster,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          // Third part: movie details
          Container(
            margin: const EdgeInsets.all(10),
            width: 2,
            height: 200,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("genre: ${movie.genre}"),
                  Text('Director: ${movie.director.join(', ')}'),
                  Text('Starring: ${movie.stars.join(', ')}'),
                  Text("language: ${movie.language}"),
                  Text('Runtime: ${movie.runTime} mins'),
                  Text(
                    'Release date: ${DateTime.fromMillisecondsSinceEpoch(movie.releasedDate * 1000)}',
                    style: TextStyle(color: Colors.blue),
                  ),
                  GestureDetector(
                      onTap: () {
                        showAlignedToast('You Pressed Watch Trailer',
                            Alignment.bottomCenter, context);
                      },
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: UiColors.primaryColor),
                          child: Center(child: Text('Watch Trailer'))))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
