import 'package:flutter/material.dart';

class CommunityPostsScreen extends StatelessWidget {
  const CommunityPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Posts'),

      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPostCard(
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS56vCVc8kvbj0XHe_yznKze5HdpHKvKNQQHw&usqp=CAU',
            description: 'Delicious pasta recipe with creamy sauce.',
            likesCount: 25,
            commentsCount: 12,
          ),
          const SizedBox(height: 16),
          _buildPostCard(
            imageUrl: 'https://images.lifestyleasia.com/wp-content/uploads/2018/12/28145437/shutterstock_404009245.jpg',
            description: 'Shimla Mrich.',
            likesCount: 25,
            commentsCount: 12,
          ),
          const SizedBox(height: 16),
          _buildPostCard(
            imageUrl: 'https://images.lifestyleasia.com/wp-content/uploads/sites/7/2022/03/07110850/salad.jpg?tr=w-1200,h-900',
            description: 'A healthy and refreshing salad recipe.',
            likesCount: 37,
            commentsCount: 5,
          ),
          // Add more post cards as needed
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle create new post button tap
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPostCard({
    required String imageUrl,
    required String description,
    required int likesCount,
    required int commentsCount,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('$likesCount Likes', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(width: 16),
                    Icon(Icons.comment, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('$commentsCount Comments', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
