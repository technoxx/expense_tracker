import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

final formatter = DateFormat().add_yMd();
const uuid = Uuid();

enum Category { food, travel, leisure, college }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: CupertinoIcons.circle_grid_hex_fill,
  Category.travel: CupertinoIcons.car_detailed,
  Category.college: CupertinoIcons.bag_fill,
};

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
