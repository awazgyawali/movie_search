import 'package:http/http.dart' as http;
import 'dart:convert';

class APIHelper {
  Future getTrendingMovies() async {
    return getRequest("/trending/movie/week");
  }

  Future getLatestMovie() async {
    return getRequest("/movie/latest");
  }

  Future getNowPlayingMovies() async {
    return getRequest("/movie/now_playing");
  }

  Future getUpcomingMovies() async {
    return getRequest("/movie/upcoming");
  }

  Future getTopRatedMovies() async {
    return getRequest("/movie/top_rated");
  }

  Future getPopularMovies() async {
    return getRequest("/movie/popular");
  }

  Future getPopularArtists() async {
    return getRequest("/person/popular");
  }

  Future getSimilarMovies(movieId) {
    return getRequest("/movie/$movieId/similar");
  }

  Future getRecommendedMovies(movieId) {
    return getRequest("/movie/$movieId/recommendations");
  }

  Future getMovieGenres() {
    return getRequest("/genre/movie/list");
  }

  Future getMovieDetail(movieId) {
    return getRequest("/movie/$movieId");
  }

  postRequest(endpoint, body) async {
    var response = (await http.post(
      "https://api.themoviedb.org/3$endpoint?api_key=f6b8b5c5073c401a78e4a6f1e65dcf60",
      body: body,
    ))
        .body;
    return json.decode(response);
  }

  getRequest(endpoint) async {
    var body = (await http.get(
            "https://api.themoviedb.org/3$endpoint?api_key=f6b8b5c5073c401a78e4a6f1e65dcf60"))
        .body;
    return json.decode(body);
  }

  getPosterUrl(path) {
    if (path != null)
      return "https://image.tmdb.org/t/p/w500" + path;
    else
      return "https://avatars1.githubusercontent.com/u/10810343?s=460&v=4";
  }
}
