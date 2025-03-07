class MovieModel {
  final String id;
  final List<String> director;
  final List<String> writers;
  final List<String> stars;
  final int releasedDate;
  final List<String> productionCompany;
  final String title;
  final String language;
  final int runTime;
  final String genre;
  final String poster;
  final int pageViews;
  final String description;
  final List<String> upVoted;
  final List<String> downVoted;
  final int totalVoted;
  final int voting;

  MovieModel({
    required this.id,
    required this.director,
    required this.writers,
    required this.stars,
    required this.releasedDate,
    required this.productionCompany,
    required this.title,
    required this.language,
    required this.runTime,
    required this.genre,
    required this.poster,
    required this.pageViews,
    required this.description,
    required this.upVoted,
    required this.downVoted,
    required this.totalVoted,
    required this.voting,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['_id'] ?? "",
      director: List<String>.from(json['director'] ?? []),
      writers: List<String>.from(json['writers'] ?? []),
      stars: List<String>.from(json['stars'] ?? []),
      releasedDate: json['releasedDate'] ?? 0,
      productionCompany: List<String>.from(json['productionCompany'] ?? []),
      title: json['title'] ?? "",
      language: json['language'] ?? "",
      runTime: json['runTime'] ?? 0,
      genre: json['genre'] ?? "",
      poster: json['poster'] ?? "",
      pageViews: json['pageViews'] ?? 0,
      description: json['description'] ?? "",
      upVoted: List<String>.from(json['upVoted'] ?? []),
      downVoted: List<String>.from(json['downVoted'] ?? []),
      totalVoted: json['totalVoted'] ?? 0,
      voting: json['voting'] ?? 0,
    );
  }
}
