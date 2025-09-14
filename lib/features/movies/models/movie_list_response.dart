import 'movie_model.dart';

class MovieListResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;
  MovieListDates? dates;

  MovieListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.dates,
  });

  MovieListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    dates = json['dates'] != null ? MovieListDates.fromJson(json['dates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    if (dates != null) {
      data['dates'] = dates!.toJson();
    }
    return data;
  }
}

class MovieListDates {
  String? maximum;
  String? minimum;

  MovieListDates({
    this.maximum,
    this.minimum,
  });

  MovieListDates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}
