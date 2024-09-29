import 'package:flutter/material.dart';

class InputDropdown extends StatefulWidget {
  final List<String> items;
  final Function(String?)? onChanged;
  final String? initialValue;
  final String? errorText;
  final TextEditingController? controller;
  const InputDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.initialValue,
    this.errorText,
    this.controller
  });

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      controller: widget.controller,
      errorText: widget.errorText,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
      width: double.infinity,
      initialSelection: widget.initialValue,
      hintText: "Pilih",
      onSelected: widget.onChanged,
      dropdownMenuEntries:
          widget.items.map<DropdownMenuEntry<String>>((String item) {
        return DropdownMenuEntry<String>(
          value: item,
          label: item,
        );
      }).toList(),
    );
  }
}
