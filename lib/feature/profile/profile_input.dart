
import 'package:flutter/material.dart';

class ProfileInput {
  final String key;
  final String label;
  final TextEditingController controller;
  final bool isEnable;
  ProfileInput({
    required this.key,
    required this.label,
    required this.controller,
    this.isEnable = true,
  });
  

  ProfileInput copyWith({
    String? key,
    String? label,
    TextEditingController? controller,
    bool? isEnable,
  }) {
    return ProfileInput(
      key: key ?? this.key,
      label: label ?? this.label,
      controller: controller ?? this.controller,
      isEnable: isEnable ?? this.isEnable,
    );
  }


  @override
  String toString() {
    return 'ProfileInput(key: $key, label: $label, controller: $controller, isEnable: $isEnable)';
  }

  @override
  bool operator ==(covariant ProfileInput other) {
    if (identical(this, other)) return true;
  
    return 
      other.key == key &&
      other.label == label &&
      other.controller == controller &&
      other.isEnable == isEnable;
  }

  @override
  int get hashCode {
    return key.hashCode ^
      label.hashCode ^
      controller.hashCode ^
      isEnable.hashCode;
  }

}
