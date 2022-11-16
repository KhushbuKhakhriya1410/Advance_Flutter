class VideoModel {
  final String id;
  final String title;
  final String thumbnailURL;
  final String channelTitlen;

  VideoModel({
    required this.id,
    required this.title,
    required this.thumbnailURL,
    required this.channelTitlen,
  });

  factory VideoModel.fromMap(Map<String, dynamic> snippet) {
    return VideoModel(
      id: snippet['resourcrId']['videoId'],
      title: snippet['title'],
      thumbnailURL: snippet['thumbnails']['high']['url'],
      channelTitlen: snippet['channelTitle'],
    );
  }
}