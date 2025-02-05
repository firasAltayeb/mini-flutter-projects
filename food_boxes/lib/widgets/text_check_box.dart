import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utility/preference_box.dart';

class TextCheckBox extends ConsumerWidget {
  const TextCheckBox({
    required this.provider,
    super.key,
  });

  final StateProvider<bool> provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAlert = ref.watch(provider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't ask me again:",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Material(
          color: Colors.transparent,
          child: Checkbox(
            activeColor: Theme.of(context).colorScheme.primary,
            value: showAlert,
            onChanged: (bool? value) {
              ref.read(provider.notifier).state = value!;
              PreferenceBox.getInstance().setConfirmLogoutToggle(value);
            },
          ),
        ),
      ],
    );
  }
}
