
import '../../common_libraries.dart';

class MovieDetailModel extends Equatable {
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
  final List<Rating> ratings;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String type;
  final String dvd;
  final String boxOffice;
  final String production;
  final String website;
  final String response;

  String get formattedRating => imdbRating != 'N/A' ? imdbRating : '0.0';

  List<String> get genreList => genre.split(', ').where((g) => g.isNotEmpty).toList();

  bool get hasPoster => poster.isNotEmpty && poster != 'N/A';

  const MovieDetailModel({
    this.title = '',
    this.year = '',
    this.rated = '',
    this.released = '',
    this.runtime = '',
    this.genre = '',
    this.director = '',
    this.writer = '',
    this.actors = '',
    this.plot = '',
    this.language = '',
    this.country = '',
    this.awards = '',
    this.poster = '',
    this.ratings = const [],
    this.metascore = '',
    this.imdbRating = '',
    this.imdbVotes = '',
    this.imdbID = '',
    this.type = '',
    this.dvd = '',
    this.boxOffice = '',
    this.production = '',
    this.website = '',
    this.response = '',
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      rated: json['Rated'] ?? '',
      released: json['Released'] ?? '',
      runtime: json['Runtime'] ?? '',
      genre: json['Genre'] ?? '',
      director: json['Director'] ?? '',
      writer: json['Writer'] ?? '',
      actors: json['Actors'] ?? '',
      plot: json['Plot'] ?? '',
      language: json['Language'] ?? '',
      country: json['Country'] ?? '',
      awards: json['Awards'] ?? '',
      poster: json['Poster'] ?? '',
      ratings: (json['Ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      metascore: json['Metascore'] ?? '',
      imdbRating: json['imdbRating'] ?? '',
      imdbVotes: json['imdbVotes'] ?? '',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      dvd: json['DVD'] ?? '',
      boxOffice: json['BoxOffice'] ?? '',
      production: json['Production'] ?? '',
      website: json['Website'] ?? '',
      response: json['Response'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'Title': title,
    'Year': year,
    'Rated': rated,
    'Released': released,
    'Runtime': runtime,
    'Genre': genre,
    'Director': director,
    'Writer': writer,
    'Actors': actors,
    'Plot': plot,
    'Language': language,
    'Country': country,
    'Awards': awards,
    'Poster': poster,
    'Ratings': ratings.map((e) => e.toJson()).toList(),
    'Metascore': metascore,
    'imdbRating': imdbRating,
    'imdbVotes': imdbVotes,
    'imdbID': imdbID,
    'Type': type,
    'DVD': dvd,
    'BoxOffice': boxOffice,
    'Production': production,
    'Website': website,
    'Response': response,
  };

  @override
  List<Object?> get props => [
    title,
    year,
    rated,
    released,
    runtime,
    genre,
    director,
    writer,
    actors,
    plot,
    language,
    country,
    awards,
    poster,
    ratings,
    metascore,
    imdbRating,
    imdbVotes,
    imdbID,
    type,
    dvd,
    boxOffice,
    production,
    website,
    response,
  ];
}

class Rating extends Equatable {
  final String source;
  final String value;

  const Rating({
    this.source = '',
    this.value = '',
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      source: json['Source'] ?? '',
      value: json['Value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'Source': source,
    'Value': value,
  };

  @override
  List<Object?> get props => [source, value];
}
