import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Select Topics'),
      content: CupertinoScrollbar(
        child: Material(
          child: ListBody(
            children: widget.items
                .map(
                  (item) => CheckboxListTile(
                    activeColor: const Color(0XFFff512f),
                    tileColor: const Color.fromARGB(255, 203, 203, 212),
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
