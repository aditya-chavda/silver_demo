class Post {
  const Post({
    required this.authorName,
    required this.authorUsername,
    required this.authorPic,
    required this.imageUrl,
    required this.content,
    required this.postedAt,
  });

  final String authorName;
  final String authorUsername;
  final String authorPic;
  final String imageUrl;
  final String content;
  final DateTime postedAt;
}
