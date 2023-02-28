class ScreenArguments {
  ScreenArguments({
    required this.resetHandler,
    required this.resultScore,
  });

  final void Function() resetHandler;
  final int resultScore;
}
