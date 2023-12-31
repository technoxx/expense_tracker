import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.addexpense, super.key});

  final void Function(ExpenseModel expense) addexpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Category selectedCategory = Category.food;

  DateTime? selectedDate;

  void addDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: DateTime.now());
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void saveExpense() {
    final titlevalue = titleController.text.trim();
    final amountvalue = double.tryParse(amountController.text);
    bool check = amountvalue == null;
    if (titlevalue.isEmpty || check || selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure that you enter all the valid values!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    } else {
      widget.addexpense(
        ExpenseModel(
            title: titleController.text,
            amount: amountvalue,
            date: selectedDate!,
            category: selectedCategory),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text(
                "Title",
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      "Amount",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select"
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: addDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  dropdownColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  items: Category.values
                      .map((categoryValue) => DropdownMenuItem(
                            value: categoryValue,
                            child: Text(categoryValue.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (categoryValue) {
                    if (categoryValue == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = categoryValue;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: saveExpense,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
