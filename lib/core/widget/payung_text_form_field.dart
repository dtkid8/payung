import 'dart:async';
import 'package:flutter/material.dart';

class PayungTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String)? onChanged;
  final Duration debounceDuration;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  const PayungTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
  });

  @override
  State<PayungTextFormField> createState() => _PayungTextFormFieldState();
}

class _PayungTextFormFieldState extends State<PayungTextFormField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onChangedDebounced(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(widget.debounceDuration, () {
      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onChanged: _onChangedDebounced,
      obscureText: widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        floatingLabelStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
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
    );
  }
}
