import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final String? value;
  final IconData? icon;
  final Function()? onTap;
  final String? hint;
  final String? errorText;
  const InputContainer({
    super.key,
    this.value,
    this.icon,
    this.onTap,
    this.hint,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: errorText != null ? Colors.red : Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: hint != null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hint ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                Visibility(
                  visible: value != null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Visibility(
                  visible: icon != null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: errorText != null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorText ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
