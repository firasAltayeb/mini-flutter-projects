class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    this.date,
  });

  final String title;
  final double amount;
  final String id;
  DateTime? date;
}
