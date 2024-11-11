import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quad_tech/model/movie_model.dart';

class MovieController extends GetxController {
  var movies = <MovieModel>[].obs;
  var searchResults = <MovieModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  // Fetch all movies for the Home Screen
  void fetchMovies() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        movies.value = data.map((json) => MovieModel.fromJson(json)).toList();
      }
    } finally {
      isLoading(false);
    }
  }

  // Search for movies based on a search term for the Search Screen
  void searchMovies(String searchTerm) async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        searchResults.value =
            data.map((json) => MovieModel.fromJson(json)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
