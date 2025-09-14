import '../../../core/config/config.dart';

class ImageUtils {
  static String? buildPosterUrl(String? posterPath, {String size = 'w500'}) {
    if (posterPath == null || posterPath.isEmpty) return null;
    return '${Config.imageBaseUrl}/$size$posterPath';
  }

  static String? buildBackdropUrl(String? backdropPath, {String size = 'w1280'}) {
    if (backdropPath == null || backdropPath.isEmpty) return null;
    return '${Config.imageBaseUrl}/$size$backdropPath';
  }

  static String? buildProfileUrl(String? profilePath, {String size = 'w185'}) {
    if (profilePath == null || profilePath.isEmpty) return null;
    return '${Config.imageBaseUrl}/$size$profilePath';
  }

  static String? buildImageUrl(String? imagePath, {String size = 'w500'}) {
    if (imagePath == null || imagePath.isEmpty) return null;
    return '${Config.imageBaseUrl}/$size$imagePath';
  }

  static List<String> getPosterSizes() => [
    'w92', 'w154', 'w185', 'w342', 'w500', 'w780', 'original'
  ];

  static List<String> getBackdropSizes() => [
    'w300', 'w780', 'w1280', 'original'
  ];

  static List<String> getProfileSizes() => [
    'w45', 'w185', 'h632', 'original'
  ];

  static List<String> getLogoSizes() => [
    'w45', 'w92', 'w154', 'w185', 'w300', 'w500', 'original'
  ];
}
