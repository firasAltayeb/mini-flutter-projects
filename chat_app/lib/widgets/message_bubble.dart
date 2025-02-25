import 'package:chat_app/theme_extension.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.userImage,
    required this.username,
    required this.message,
    required this.currentUser,
  }) : isFirstInSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.currentUser,
  })  : isFirstInSequence = false,
        userImage = null,
        username = null;

  final bool isFirstInSequence;
  final String? userImage;
  final String? username;
  final String message;
  final bool currentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            right: currentUser ? 0 : null,
            child: CircleAvatar(
              backgroundImage:
                  userImage!.isNotEmpty ? NetworkImage(userImage!) : null,
              backgroundColor: context.primaryColor.withAlpha(180),
              radius: 23,
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 46),
          child: Row(
            mainAxisAlignment:
                currentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: currentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (isFirstInSequence) const SizedBox(height: 18),
                  if (username != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        username!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    constraints: const BoxConstraints(maxWidth: 200),
                    decoration: BoxDecoration(
                      color: currentUser
                          ? const Color(0xFFE0E0E0)
                          : context.secondaryColor.withAlpha(200),
                      borderRadius: BorderRadius.only(
                        topLeft: !currentUser && isFirstInSequence
                            ? Radius.zero
                            : const Radius.circular(12),
                        topRight: currentUser && isFirstInSequence
                            ? Radius.zero
                            : const Radius.circular(12),
                        bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        height: 1.3,
                        color: currentUser
                            ? const Color(0xDD000000)
                            : context.onSecondaryColor,
                      ),
                      softWrap: true,
                    ),
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
