import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializeMainProviders = FutureProvider.autoDispose<void>((ref) async {
  ref.read(appProvidersInitialized.notifier).state = true;
});

final appProvidersInitialized = StateProvider.autoDispose<bool>((ref) => false);
