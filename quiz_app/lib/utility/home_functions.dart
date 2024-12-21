import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import 'dimension_extensions.dart';
import 'enum_land.dart';
import 'shared_providers.dart';

void initializeProviders(WidgetRef ref) {
  if (ref.read(correctPlayerProvider) == null) {
    final correctAudioPlayer = AudioPlayer();
    correctAudioPlayer.setReleaseMode(ReleaseMode.stop);
    correctAudioPlayer.setSourceAsset(SoundEffect.correct.address);
    Future.delayed(Duration(milliseconds: 10), () {
      ref.read(correctPlayerProvider.notifier).state = correctAudioPlayer;
    });
  }
  if (ref.read(incorrectPlayerProvider) == null) {
    final incorrectAudioPlayer = AudioPlayer();
    incorrectAudioPlayer.setReleaseMode(ReleaseMode.stop);
    incorrectAudioPlayer.setSourceAsset(SoundEffect.incorrect.address);
    Future.delayed(Duration(milliseconds: 10), () {
      ref.read(incorrectPlayerProvider.notifier).state = incorrectAudioPlayer;
    });
  }
}

Future<void> stopPlayingSound(WidgetRef ref) async {
  final incorrectPlayer = ref.read(incorrectPlayerProvider);
  final correctPlayer = ref.read(correctPlayerProvider);
  if (incorrectPlayer?.state == PlayerState.playing) {
    await incorrectPlayer?.stop();
  }
  if (correctPlayer?.state == PlayerState.playing) {
    await correctPlayer?.stop();
  }
}

Future<void> playSoundEffect(WidgetRef ref, SoundEffect effect) async {
  if (effect == SoundEffect.correct) {
    final correctPlayer = ref.read(correctPlayerProvider);
    correctPlayer?.resume();
  } else {
    final incorrectPlayer = ref.read(incorrectPlayerProvider);
    incorrectPlayer?.resume();
  }
}

SnackBar messageSnackBar(
  BuildContext context,
  String message, {
  int timeUp = 750,
}) {
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: AppConstants.circleRadius,
    ),
    duration: Duration(milliseconds: timeUp),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: context.percentHeight(2.5),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: context.percentWidth(20),
      right: context.percentWidth(20),
      bottom: context.percentHeight(5),
    ),
  );
}

String counterDisplay(queueIdx, itemNumber) {
  var counter = itemNumber > 9 && queueIdx + 1 < 10
      ? "0${queueIdx + 1}/$itemNumber"
      : "${queueIdx + 1}/$itemNumber";
  return counter;
}
