class Video {
  final String videoName;
  final String videoUrl;
  final String description;

  Video({
    required this.videoName,
    required this.videoUrl,
    required this.description,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoName:
          json['title'] ?? '', // Change this to match the key in your JSON
      videoUrl: json['video_url'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': videoName, // Change this to match the key in your JSON
      'video_url': videoUrl,
      'description': description,
    };
  }
}
