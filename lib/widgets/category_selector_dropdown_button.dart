import 'package:flutter/material.dart';
import 'package:trackexpenses/models/expense.dart';

class CategorySelectorDropdownButton extends StatefulWidget {
  const CategorySelectorDropdownButton({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final Category selectedCategory;
  final ValueChanged<Category> onCategoryChanged;

  @override
  State<StatefulWidget> createState() {
    return _CategorySelectorDropdownButtonState();
  }
}

class _CategorySelectorDropdownButtonState
    extends State<CategorySelectorDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      iconSize: 20,
      icon: const Icon(Icons.task_rounded),
      enableFeedback: true,
      value: widget.selectedCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name.toUpperCase()),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          widget.onCategoryChanged(value);
        }
      },
    );
  }
}
