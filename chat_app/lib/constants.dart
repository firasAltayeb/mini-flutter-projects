import 'package:flutter/material.dart';

abstract class Constants {
  static const circularRadius = Radius.circular(12);
  static const blackShade = Color(0xDD000000);

  // Firestore collections keys
  static const usersKey = 'users';
  static const chatKey = 'chat';
  static const userImagesKey = 'user_images';

  // Firestore document keys
  static const emailKey = 'email';
  static const textKey = 'text';
  static const createdAtKey = 'createdAt';
  static const userIdKey = 'userId';
  static const userImageKey = 'userImage';
  static const userNameKey = 'userName';
}
