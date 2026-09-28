import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
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
  ];

  // ADDITIONAL FEATURE:
  // Search text and selected category filter
  String _searchText = '';
  Category? _selectedFilterCategory;

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                expenseIndex,
                expense,
              );
            });
          },
        ),
      ),
    );
  }

  // ADDITIONAL FEATURE:
  // Filters expenses based on search and category
  List<Expense> get _filteredExpenses {
    return _registeredExpenses.where((expense) {
      final matchesSearch = expense.title
          .toLowerCase()
          .contains(_searchText.toLowerCase());

      final matchesCategory =
          _selectedFilterCategory == null ||
              expense.category == _selectedFilterCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  // ADDITIONAL FEATURE:
  // Calculates total amount of displayed expenses
  double get _totalExpenses {
    double total = 0;

    for (final expense in _filteredExpenses) {
      total += expense.amount;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Start adding some!',
      ),
    );

    if (_filteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _filteredExpenses,
        onRemoveExpense: _removeExpense,
      );
    } else if (_registeredExpenses.isNotEmpty) {
      mainContent = const Center(
        child: Text(
          'No matching expenses found.',
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(
            expenses: _registeredExpenses,
          ),

          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search expenses',
                hintText: 'Enter expense title',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),

          const SizedBox(height: 8),

          // CATEGORY FILTER
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                const Icon(Icons.filter_list),

                const SizedBox(width: 8),

                const Text(
                  'Filter:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: DropdownButton<Category?>(
                    value: _selectedFilterCategory,
                    isExpanded: true,
                    hint: const Text('All Categories'),
                    items: [
                      const DropdownMenuItem<Category?>(
                        value: null,
                        child: Text('All Categories'),
                      ),
                      ...Category.values.map(
                        (category) {
                          return DropdownMenuItem<Category?>(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          );
                        },
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedFilterCategory = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // TOTAL EXPENSE DISPLAY
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              8,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet,
                    ),

                    const SizedBox(width: 10),

                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    Text(
                      '\$${_totalExpenses.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}