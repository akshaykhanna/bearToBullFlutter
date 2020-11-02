import 'package:flutter/material.dart';

class SortDropDown extends StatefulWidget {
  const SortDropDown({
    @required Function(String) onSortPressed,
  }) : _onSortPressed = onSortPressed;

  final Function(String) _onSortPressed;

  @override
  _SortDropDownState createState() => _SortDropDownState();
}

class _SortDropDownState extends State<SortDropDown> {
  String _value = "A-Z";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text("A-Z"),
            value: "A-Z",
          ),
          DropdownMenuItem(
            child: Text("Z-A"),
            value: "Z-A",
          ),
          DropdownMenuItem(
            child: Text("Price"),
            value: "Price",
          )
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
          widget._onSortPressed(value);
        });
  }
}
