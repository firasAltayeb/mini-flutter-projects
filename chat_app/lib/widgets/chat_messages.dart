import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(snapshot.hasData
                ? 'No messages found'
                : 'Something went wrong...'),
          );
        }
        final loadedMessages = snapshot.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (_, index) {
            final chatMessage = loadedMessages[index].data();
            final isCurrentUser = loggedUser.uid == chatMessage['userId'];
            final isFirstInSequence = index + 1 >= loadedMessages.length ||
                loadedMessages[index + 1].data()['userId'] !=
                    chatMessage['userId'];

            return MessageBubble(
              isFirstInSequence: isFirstInSequence,
              currentUser: isCurrentUser,
              userImage: isFirstInSequence ? chatMessage['userImage'] : null,
              userName: isFirstInSequence ? chatMessage['userName'] : null,
              message: chatMessage['text'],
            );
          },
        );
      },
    );
  }
}
