import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessages>{
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void submitMessage()async{
    
    final enteredMessage = _messageController.text;
    if(enteredMessage.trim().isEmpty){
      return;
    }

    FocusScope.of(context).unfocus();
    
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['username']
    });

    _messageController.clear();
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 22),
      child: Row(
        children: [
          Expanded(child: TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: const InputDecoration(
              labelText: "Send a message..."
            ),
          )),
          IconButton(onPressed: submitMessage, icon: Icon(Icons.send, color: Theme.of(context).colorScheme.primary,))
        ],
      ),
    );
  }
}