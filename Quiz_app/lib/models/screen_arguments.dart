class ScreenArguments {
  ScreenArguments(
    this.resetHandler,
    this.resultScore,
    this.questions,
  );

  final List<Map<String, Object>> questions;
  final void Function() resetHandler;
  final int resultScore;
}
