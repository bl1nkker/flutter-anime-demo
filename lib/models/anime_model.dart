class AnimeModel {
  final String id;
  final String imageUrl;
  final String title;
  final String overview;
  final double rating;

  const AnimeModel(
      {required this.id,
      required this.imageUrl,
      required this.overview,
      required this.rating,
      required this.title});
}
