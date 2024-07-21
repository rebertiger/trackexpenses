import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Titleinputtextfield extends StatelessWidget {
  Titleinputtextfield({super.key, required this.controller});
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      controller: controller,
                      decoration: const InputDecoration(
                        label: Text("Expense"),
                      ),
                    );
  }
}

