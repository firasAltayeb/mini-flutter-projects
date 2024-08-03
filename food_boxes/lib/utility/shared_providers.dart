import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/utility/preference_box.dart';

final intializeMainProviders = Provider.autoDispose(
  (ref) async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    ref.read(userIDProvider.notifier).state = user?.uid ?? '';
    updateProviders(ref, data: userData.data());
    ref.read(appProvidersInitialized.notifier).state = true;
  },
);

void updateProviders(dynamic ref, {Map<String, dynamic>? data}) {
  if (data != null) {
    ref.read(firstNameProvider.notifier).state = data["firstName"];
    ref.read(lastNameProvider.notifier).state = data["lastName"];
    ref.read(ageProvider.notifier).state = data["age"];
  }
}

final appProvidersInitialized = StateProvider<bool>((ref) => false);

final firstNameProvider = StateProvider<String>((ref) => "");

final userIDProvider = StateProvider<String>((ref) => "");

final ageProvider = StateProvider<String>((ref) => "");

final lastNameProvider = StateProvider<String>((ref) => "");

final logoutToggleProvider = StateProvider<bool>(
    (ref) => PreferenceBox.getInstance().getConfirmLogoutToggle());
