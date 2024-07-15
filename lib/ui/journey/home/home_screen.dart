import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/movie_model.dart';
import 'package:flutter_application_1/domain/movie_repository.dart';
import 'package:flutter_application_1/network/client.dart';
import 'package:flutter_application_1/ui/journey/home/about/about_page.dart';
import 'package:flutter_application_1/ui/journey/home/movie_card.dart';
import 'package:flutter_application_1/ui/journey/welcome/welcome_screen.dart';
import 'package:flutter_application_1/ui/ui_utils/constants/ui_colors.dart';
import 'package:flutter_application_1/ui/ui_utils/get_prog_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieRepository repo = MovieRepository.getInstance();
  bool _isLoading = true;
  late List<MovieModel> movies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo.getMovieList().then((mvs) {
      setState(() {
        movies = mvs;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          // IconButton(
          //     onPressed: () async {
          //       for (var movie in movies) {
          //         print('movie is registered for title ${movie.title}');
          //       }
          //     },
          //     icon: Icon(Icons.refresh))
          PopupMenuButton(
              color: UiColors.primaryColor,
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: TextButton(
                      child: Text(
                        'Company Info',
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => AboutPage()));
                      },
                    )),
                    PopupMenuItem(
                        child: TextButton(
                      child: Text(
                        'Log Out',
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (c) => WelcomeScreen()),
                            (r) => false);
                      },
                    ))
                  ])
        ],
      ),
      body: _isLoading
          ? getProgressIndicator(color: UiColors.primaryColor)
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
              }),
    );
  }
}
