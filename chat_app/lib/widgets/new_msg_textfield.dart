import 'package:chat_app/constants.dart';
import 'package:chat_app/theme_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessageTextField extends StatefulWidget {
  const NewMessageTextField({super.key});

  @override
  State<NewMessageTextField> createState() => _NewMessageTextFieldState();
}

class _NewMessageTextFieldState extends State<NewMessageTextField> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;
    if (enteredMessage.trim().isNotEmpty) {
      FocusScope.of(context).unfocus();
      _messageController.clear();

      final user = FirebaseAuth.instance.currentUser!;
      final userData = await FirebaseFirestore.instance
          .collection(Constants.usersKey)
          .doc(user.uid)
          .get();

      if (userData.data() != null) {
        FirebaseFirestore.instance.collection(Constants.chatKey).add({
          Constants.textKey: enteredMessage,
          Constants.createdAtKey: Timestamp.now(),
          Constants.userIdKey: user.uid,
          Constants.userNameKey: userData.data()![Constants.userNameKey],
          Constants.userImageKey: userData.data()![Constants.userImageKey],
        });
      } else {
        print("userData is null");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 5, bottom: 30),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _messageController,
              enableSuggestions: true,
              autocorrect: true,
              decoration: const InputDecoration(
                labelText: 'Type to send a message...',
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          IconButton(
            color: context.primaryColor,
            onPressed: _submitMessage,
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
