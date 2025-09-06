import '../../common_libraries.dart';

class MovieRepository extends BaseRepository {
  static const String _apiKey = "35882e11";

  /// Search movies by title
  Future<MovieDataModel> searchMovies(String title) async {
    final response = await getRequest("", queryParams: {
      "s": title.isNotEmpty ? title : "test",
      "apikey": _apiKey,
    });

    if (response.statusCode == 200) {
      // Parse JSON into model
      return MovieDataModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load movie search results");
    }
  }

  /// Get movie details by IMDb ID
  Future<MovieDetailModel> getMovieDetail(String imdbID) async {
    final response = await getRequest("", queryParams: {
      "i": imdbID,
      "apikey": _apiKey,
    });

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load movie details");
    }
  }
}
