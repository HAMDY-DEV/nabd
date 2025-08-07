class PostModel {
  final String keyPost;
  final String description;
  final String creatorId;
  final String creatorName;
  final String creatorPhoto;
  final String time;
  final String photo;
  final List<dynamic> likes;
  final List<dynamic> comments;
  final String views;

  PostModel({
    required this.keyPost,
    required this.description,
    required this.creatorId,
    required this.creatorName,
    required this.creatorPhoto,
    required this.time,
    required this.photo,
    required this.likes,
    required this.comments,
    required this.views,
  });

  factory PostModel.fromMap(Map data) {
    return PostModel(
      keyPost: data['keyPost'] ?? '',
      description: data['description'] ?? '',
      creatorId: data['creatorId'] ?? '',
      creatorName: data['creatorName'] ?? '',
      creatorPhoto: data['creatorPhoto'] ?? '',
      time: data['time'] ?? '',
      photo: data['photo'] ?? '',
      likes: List.from(data['likes'] ?? []),
      comments: List.from(data['comments'] ?? []),
      views: data['views'] ?? '0',
    );
  }
}
