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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['imdbID'] ?? json['id'],
      title: json['Title'] ?? json['title'],
      year: json['Year'] ?? json['year'],
      type: json['Type'] ?? json['type'],
      poster: json['Poster'] ?? json['poster'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'poster': poster,
      'type': type,
    };
  }

  @override
  String toString() => '$id, $title';
}
