import 'package:flutter/material.dart';

import '../extensions.dart';
import '../models/post.dart';
import 'post_footer_icon.dart';

class TwitterPostTile extends StatelessWidget {
  const TwitterPostTile({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: CircleAvatar(
            radius: 28,
            backgroundImage:
                post.authorPic.isEmpty ? null : NetworkImage(post.authorPic),
            child: post.authorPic.isEmpty
                ? const Icon(Icons.person, size: 28)
                : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.authorName,
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${post.authorUsername} • ${post.postedAt.format()}',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                post.content,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 8),
              if (post.imageUrl.isNotEmpty)
                Container(
                  width: double.maxFinite,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: NetworkImage(post.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PostFooterIcon(
                    icon: Icons.chat_bubble_outline_rounded,
                  ),
                  PostFooterIcon(icon: Icons.autorenew_rounded),
                  PostFooterIcon(
                    icon: Icons.favorite_border_rounded,
                  ),
                  PostFooterIcon(icon: Icons.bar_chart_outlined),
                  PostFooterIcon(
                    icon: Icons.bookmark_border_rounded,
                    quantized: false,
                  ),
                  PostFooterIcon(
                    icon: Icons.file_upload_outlined,
                    quantized: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
