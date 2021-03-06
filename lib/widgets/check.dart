
import 'package:flutter/material.dart';

class CheckBoxOption extends StatefulWidget {
  const CheckBoxOption({required this.opcion});

  @override
  _CheckBoxOptionState createState() => _CheckBoxOptionState();
  final String opcion;
}

class _CheckBoxOptionState extends State<CheckBoxOption> {
  bool selected = false;

  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Color.fromRGBO(10, 161, 244, 1),
      value: this.selected, //checkbox.selected,
      title: Text(widget.opcion),
      onChanged: (value) {
        setState(() {
          this.selected = value!;
          print(selected);
          print(widget.opcion);
        });
      },
    );
  }
}
