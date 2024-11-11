import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quad_tech/controller/movie_controller.dart';

import 'movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Movies', style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 272,
          ),
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            final movie = movieController.movies[index];
            return GestureDetector(
              onTap: () => Get.to(MovieDetailScreen(movie: movie)),
              child: Card(
                color: Colors.black,
                child: Column(
                  children: [
                    Image.network(movie.imageUrl, fit: BoxFit.cover),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(movie.title,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
