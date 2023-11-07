import 'package:flutter/widgets.dart';
import 'package:frist_app/models/expense.dart';
import 'package:frist_app/widget/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(
        expense: expenses[index],
      ),
    );
  }
}
