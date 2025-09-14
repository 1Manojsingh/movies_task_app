class Movie {
  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  bool? adult;
  String? originalLanguage;
  String? originalTitle;
  double? popularity;
  bool? hasVideo;
  List<int>? genreIds;
  bool? isBookmarked;
  int? runtime;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.hasVideo,
    this.genreIds,
    this.isBookmarked,
    this.runtime,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count'];
    adult = json['adult'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    popularity = json['popularity']?.toDouble();
    hasVideo = json['video'];
    if (json['genre_ids'] != null) {
      genreIds = <int>[];
      json['genre_ids'].forEach((v) {
        genreIds!.add(v);
      });
    }
    isBookmarked = json['is_bookmarked'] ?? false;
    runtime = json['runtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    data['release_date'] = releaseDate;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['adult'] = adult;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['popularity'] = popularity;
    data['video'] = hasVideo;
    data['genre_ids'] = genreIds;
    data['is_bookmarked'] = isBookmarked;
    return data;
  }
}
