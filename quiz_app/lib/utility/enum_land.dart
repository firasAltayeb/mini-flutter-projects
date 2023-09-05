enum SoundEffect {
  incorrect,
  correct,
}

extension SeExtension on SoundEffect {
  String get address {
    switch (this) {
      case SoundEffect.correct:
        return 'sounds/correct.mp3';
      case SoundEffect.incorrect:
        return 'sounds/incorrect.mp3';
      default:
        return '';
    }
  }
}
