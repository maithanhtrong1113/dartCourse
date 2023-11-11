import 'package:flutter/widgets.dart';
import 'package:frist_app/models/expense.dart';
import 'package:frist_app/widget/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpanse});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpanse;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) => {
          onRemoveExpanse(expenses[index]),
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
