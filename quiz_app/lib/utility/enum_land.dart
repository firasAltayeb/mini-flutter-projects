enum SoundEffect {
  Incorrect,
  Correct,
}

extension SoundExtension on SoundEffect {
  String get address {
    switch (this) {
      case SoundEffect.Correct:
        return 'sounds/correct.mp3';
      default:
        return 'sounds/incorrect.mp3';
    }
  }
}
