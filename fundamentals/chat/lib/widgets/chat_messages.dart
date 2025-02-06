import 'package:chat/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctz, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No messages yet"),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }

          final loadedMessages = snapshot.data!.docs;

          return ListView.builder(
              reverse: true,
              padding: const EdgeInsets.only(bottom: 40, left: 12, right: 12),
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final chatMessaege = loadedMessages[index].data();
                final nextChatMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;

                final currentMessageuser = chatMessaege['userId'];
                final nextMessageuser = nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextUserIsSame = nextMessageuser == currentMessageuser;

                if(nextUserIsSame){
                  return MessageBubble.next(message: chatMessaege['text'], isMe: user!.uid == currentMessageuser);
                }else{
                  return MessageBubble.first(username: chatMessaege['username'], message: chatMessaege['text'], isMe: user!.uid == currentMessageuser);
                }


              });
        });
  }
}
