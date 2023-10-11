import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Support'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              reverse: true,
              children: [
                _buildChatMessage(
                  message: 'Hello, I need assistance with my account.',
                  isSentByUser: true,
                ),
                _buildChatMessage(
                  message: 'Sure, I\'m here to help. What seems to be the problem?',
                  isSentByUser: false,
                ),
                _buildChatMessage(
                  message: 'I forgot my password and cannot log in.',
                  isSentByUser: true,
                ),
                _buildChatMessage(
                  message: 'I can help you reset your password. Please provide your email address.',
                  isSentByUser: false,
                ),
                // Add more chat messages as needed
              ],
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatMessage({
    required String message,
    required bool isSentByUser,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border(
          top: BorderSide(color: Colors.grey[400]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Handle send message button tap
            },
            icon: Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
