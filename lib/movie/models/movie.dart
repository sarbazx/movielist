final class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  final String id;
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final List<dynamic> ratings;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String type;
  final String dvd;
  final String boxOffice;
  final String production;
  final String website;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['imdbID'],
        title: json['Title'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
        rated: json['Rated'],
        released: json['Released'],
        runtime: json['Runtime'],
        genre: json['Genre'],
        director: json['Director'],
        writer: json['Writer'],
        actors: json['Actors'],
        plot: json['Plot'],
        language: json['Language'],
        country: json['Country'],
        awards: json['Awards'],
        ratings: json['Ratings'],
        metascore: json['Metascore'],
        imdbRating: json['imdbRating'],
        imdbVotes: json['imdbVotes'],
        imdbID: json['imdbID'],
        dvd: json['DVD'],
        boxOffice: json['BoxOffice'],
        production: json['Production'],
        website: json['Website'],
      );

  @override
  String toString() => title;
}
