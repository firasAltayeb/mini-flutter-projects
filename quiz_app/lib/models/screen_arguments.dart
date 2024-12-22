class ScreenArguments {
  const ScreenArguments({
    required this.resetHandler,
    required this.totalScore,
  });

  final void Function() resetHandler;
  final int totalScore;
}
