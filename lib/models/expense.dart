import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


final formatter = DateFormat.yMEd();


const uuid = Uuid();
enum Category { food,transportation,leisure,work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.transportation: Icons.cabin,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({required this.title, required this.amount, required this.date,required this.category}) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}