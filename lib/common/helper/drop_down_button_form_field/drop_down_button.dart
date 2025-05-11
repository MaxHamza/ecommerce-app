import 'package:flutter/material.dart';
class DropDowButtonForm extends StatelessWidget {
  const DropDowButtonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Age Range',
        labelStyle:const TextStyle(color: Colors.white),
        filled: true,
        fillColor:const Color(0xFF2C2C3E), // dark purple background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // rounded corners
          borderSide: BorderSide.none,
        ),
        contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      dropdownColor: const Color(0xFF2C2C3E), // dropdown background
      iconEnabledColor: Colors.white,   // dropdown arrow color
      style:const TextStyle(color: Colors.white),
      value: null,
      items: ['18-25', '26-35', '36-45', '46+']
          .map((age) => DropdownMenuItem(value: age, child: Text(age)))
          .toList(),
      onChanged: (value) {
        // handle selection
      },
    );;
  }
}
