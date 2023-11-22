class VideoInfo {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String videoTitle;
  final String thumbnailUrl;
  final String videoUrl;

  const VideoInfo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.videoTitle,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  VideoInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? videoTitle,
    String? videoUrl,
    String? thumbnailUrl,
  }) {
    return VideoInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      videoTitle: videoTitle ?? this.videoTitle,
    );
  }
}

abstract interface class VideoInfoDocumentFields {
  static const id = 'id';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const videoUrl = 'videoUrl';
  static const videoTitle = 'videoTitle';
  static const thumbnailUrl = 'thumbnailUrl';
}
