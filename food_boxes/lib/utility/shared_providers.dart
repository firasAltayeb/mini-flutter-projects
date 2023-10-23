import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializeMainProviders = FutureProvider.autoDispose<void>((ref) async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userData = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.uid)
      .get();
  ref.read(currentUserProviders.notifier).state = currentUser;
  ref.read(firstNameProviders.notifier).state =
      userData.data()?['firstName'] ?? '';
  ref.read(lastNameProviders.notifier).state =
      userData.data()?['lastName'] ?? '';
  ref.read(ageProviders.notifier).state = userData.data()?['age'] ?? '';
  ref.read(appProvidersInitialized.notifier).state = true;
});

final appProvidersInitialized = StateProvider.autoDispose<bool>((ref) => false);

final currentUserProviders = StateProvider<User?>((ref) => null);

final firstNameProviders = StateProvider<String>((ref) => '');

final lastNameProviders = StateProvider<String>((ref) => '');

final ageProviders = StateProvider<String>((ref) => '');
