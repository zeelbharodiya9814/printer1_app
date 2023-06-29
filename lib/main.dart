import 'package:flutter/material.dart';
import 'package:printer_app/views/screens/attendance.dart';
import 'package:printer_app/views/screens/expense.dart';
import 'package:printer_app/views/screens/expenseData.dart';
import 'package:printer_app/views/screens/homepage.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        // 'Expense' : (context) => Expense(),
        // 'ExpenseData' : (context) => ExpenseData(),
        // 'Attendance' : (context) => Attendance(),
      },
    ),
  );
}