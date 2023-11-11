import 'package:flutter/material.dart';
import 'package:frist_app/widget/chart/chart.dart';
import 'package:frist_app/widget/expenses_list.dart';
import 'package:frist_app/models/expense.dart';
import 'package:frist_app/widget/new_expense.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Travel expense',
      amount: 60,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Dinner',
      amount: 10,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  // void _changeTheme() {
  //   AdaptiveTheme.of(context).toggleThemeMode();
  // }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Expense deleted',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget main = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'No expenses found. Start adding some!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 35, 151, 240),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 35, 151, 240),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            // onPressed: _openAddExpenseOverlay,
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
    if (_registeredExpenses.isNotEmpty) {
      main = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpanse: _removeExpense);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter ExpenseTracker',
            style: TextStyle(
              color: Color.fromARGB(255, 35, 151, 240),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 35, 151, 240),
                      elevation: 100),
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                  color: Colors.white,
                  onPressed: _openAddExpenseOverlay,
                ),
                Switch(
                  value: AdaptiveTheme.of(context).mode.isDark,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                ),
              ],
            )
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: main,
          ),
        ]),
      ),
    );
  }
}
