import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../models/forum_post.dart';

class ForumPostCard extends StatelessWidget {
  final ForumPost post;
  final VoidCallback onTap;

  const ForumPostCard({
    Key? key,
    required this.post,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Author details section
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(post.authorPhotoUrl.isNotEmpty
                        ? post.authorPhotoUrl
                        : 'https://www.example.com/default-profile.png'),  // Placeholder URL for broken images
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.authorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          timeago.format(post.createdAt),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Title
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 4),
              
              // Content (Shortened to 3 lines)
              Text(
                post.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Likes and Comments section
              Row(
                children: [
                  _buildIconText(Icons.favorite, post.likes),
                  const SizedBox(width: 16),
                  _buildIconText(Icons.comment, post.commentCount),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom method to build an icon and text together (Likes, Comments)
  Widget _buildIconText(IconData icon, int count) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: (icon == Icons.favorite) ? Colors.red[400] : Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          '$count',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
