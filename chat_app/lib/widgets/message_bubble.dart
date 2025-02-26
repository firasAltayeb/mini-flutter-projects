import 'package:chat_app/constants.dart';
import 'package:chat_app/theme_extension.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.userImage,
    required this.userName,
    required this.message,
    required this.currentUser,
    required this.isFirstInSequence,
  });

  final bool isFirstInSequence;
  final String? userImage;
  final String? userName;
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
              backgroundColor: context.randomColor,
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
                  if (userName != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        userName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.blackShade,
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
                            : Constants.circularRadius,
                        topRight: currentUser && isFirstInSequence
                            ? Radius.zero
                            : Constants.circularRadius,
                        bottomLeft: Constants.circularRadius,
                        bottomRight: Constants.circularRadius,
                      ),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        height: 1.3,
                        color: currentUser
                            ? Constants.blackShade
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
