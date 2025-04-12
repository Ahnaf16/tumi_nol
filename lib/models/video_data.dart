class VideoData {
  const VideoData({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.playlistId,
    required this.thumbnailFile,
    required this.downloadedPath,
  });

  final String id;
  final String title;
  final String description;
  final String author;
  final String playlistId;
  final String? thumbnailFile;
  final String? downloadedPath;
}
