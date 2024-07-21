import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Amountinputtextfield extends StatelessWidget {
  Amountinputtextfield({super.key, required this.controller});
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 9,
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: const InputDecoration(
        prefixText: '\$',
        label: Text("Amount you spent"),
      ),
    );
  }
}
