part of values;

class YouTubeVideoData {
  final String title;
  final String videoId;
  final String? description;

  const YouTubeVideoData({
    required this.title,
    required this.videoId,
    this.description,
  });

  String get thumbnailUrl => "https://img.youtube.com/vi/$videoId/maxresdefault.jpg";
  String get fallbackThumbnail => "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
}
