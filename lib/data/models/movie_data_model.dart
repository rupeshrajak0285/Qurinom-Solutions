
import '../../common_libraries.dart';

class MovieDataModel extends Equatable {
  final List<MovieItem> search;
  final String totalResults;
  final String response;

  const MovieDataModel({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  factory MovieDataModel.fromJson(Map<String, dynamic> json) {
    return MovieDataModel(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => MovieItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      totalResults: json['totalResults'] ?? '',
      response: json['Response'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'Search': search.map((e) => e.toJson()).toList(),
    'totalResults': totalResults,
    'Response': response,
  };

  @override
  List<Object?> get props => [search, totalResults, response];
}

class MovieItem extends Equatable {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  const MovieItem({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      poster: json['Poster'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'Title': title,
    'Year': year,
    'imdbID': imdbID,
    'Type': type,
    'Poster': poster,
  };

  @override
  List<Object?> get props => [title, year, imdbID, type, poster];
}
