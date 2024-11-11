class MovieModel {
  final String title;
  final String summary;
  final String imageUrl;

  MovieModel(
      {required this.title, required this.summary, required this.imageUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['show']['name'] ?? 'No title',
      summary: json['show']['summary'] ?? 'No summary',
      imageUrl:
          json['show']['image']?['medium'] ?? 'https://via.placeholder.com/150',
    );
  }
}
