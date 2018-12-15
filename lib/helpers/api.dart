import 'package:http/http.dart' as http;
import 'dart:convert';

class APIHelper {
  Future getTrendingMovies({page}) async {
    return getRequest("/trending/movie/week", page);
  }

  Future getTrendingTVShows({page}) async {
    return getRequest("/trending/tv/week", page);
  }

  Future getTrendingArtist({page}) async {
    return getRequest("/trending/person/week", page);
  }

  Future getLatestMovie({page}) async {
    return getRequest("/movie/latest", page);
  }

  Future getNowPlayingMovies({page}) async {
    return getRequest("/movie/now_playing", page);
  }

  Future getUpcomingMovies({page}) async {
    return getRequest("/movie/upcoming", page);
  }

  Future getTopRatedMovies({page}) async {
    return getRequest("/movie/top_rated", page);
  }

  Future getTopRatedTVShows({page}) async {
    return getRequest("/tv/top_rated", page);
  }

  Future getPopularMovies({page = 1}) async {
    return getRequest("/movie/popular", page);
  }

  Future getPopularTVShows({page = 1}) async {
    return getRequest("/tv/popular", page);
  }

  Future getOnTheAirTVShows({page}) async {
    return getRequest("/tv/on_the_air", page);
  }

  Future getAiringTodayTVShows({page}) async {
    return getRequest("/tv/airing_today", page);
  }

  Future getPopularArtists({page}) async {
    return getRequest("/person/popular", page);
  }

  Future getSimilarMovies(movieId, {page}) {
    return getRequest("/movie/$movieId/similar", page);
  }

  Future getSimilarTVShows(tvId, {page}) {
    return getRequest("/tv/$tvId/similar", page);
  }

  Future getRecommendedMovies(movieId, {page}) {
    return getRequest("/movie/$movieId/recommendations", page);
  }

  Future getRecommendedTVShows(tvId, {page}) {
    return getRequest("/tv/$tvId/recommendations", page);
  }

  Future getMovieGenres({page}) {
    return getRequest("/genre/movie/list", page);
  }

  Future getTVShowGenres({page}) {
    return getRequest("/genre/tv/list", page);
  }

  Future getMovieDetail(movieId) {
    return getRequest("/movie/$movieId", 0);
  }

  Future getTVShowDetail(tvId) {
    return getRequest("/tv/$tvId", 0);
  }

  Future getMovieReviews(movieId, {page}) {
    return getRequest("/movie/$movieId/reviews", page);
  }

  Future getTVShowReviews(tvId, {page}) {
    return getRequest("/tv/$tvId/reviews", page);
  }

  postRequest(endpoint, body) async {
    var response = (await http.post(
      "https://api.themoviedb.org/3$endpoint?api_key=f6b8b5c5073c401a78e4a6f1e65dcf60",
      body: body,
    ))
        .body;
    return json.decode(response);
  }

  getRequest(endpoint, page) async {
    var body = (await http.get(
            "https://api.themoviedb.org/3$endpoint?api_key=f6b8b5c5073c401a78e4a6f1e65dcf60&page=${page ?? 1}"))
        .body;
    print(
        "https://api.themoviedb.org/3$endpoint?api_key=f6b8b5c5073c401a78e4a6f1e65dcf60");
    return json.decode(body);
  }

  getPosterUrl(path) {
    if (path != null)
      return "https://image.tmdb.org/t/p/w500" + path;
    else
      return "https://avatars1.githubusercontent.com/u/10810343?s=460&v=4";
  }
}
