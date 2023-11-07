import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work } // init enum

const uuid = Uuid();

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  final Category category;
}
