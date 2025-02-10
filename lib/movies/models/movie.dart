final class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.type,
    required this.year,
  });

  final String id;
  final String title;
  final String poster;
  final String type;
  final String year;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['imdbID'],
        title: json['Title'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
      );

  @override
  String toString() => '$id, $title';
}
