// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeBottomNavigationMenu {
  final String icon;
  final String label;
  final int count;
  final bool isShowNotification;
  HomeBottomNavigationMenu({
    required this.icon,
    required this.label,
    required this.count,
    this.isShowNotification = false,
  });

  HomeBottomNavigationMenu copyWith({
    String? icon,
    String? label,
    int? count,
    bool? isShowNotification,
  }) {
    return HomeBottomNavigationMenu(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      count: count ?? this.count,
      isShowNotification: isShowNotification ?? this.isShowNotification,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'label': label,
      'count': count,
      'isShowNotification': isShowNotification,
    };
  }

  factory HomeBottomNavigationMenu.fromMap(Map<String, dynamic> map) {
    return HomeBottomNavigationMenu(
      icon: map['icon'] as String,
      label: map['label'] as String,
      count: map['count'] as int,
      isShowNotification: map['isShowNotification'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeBottomNavigationMenu.fromJson(String source) =>
      HomeBottomNavigationMenu.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeBottomNavigationMenu(icon: $icon, label: $label, count: $count, isShowNotification: $isShowNotification)';
  }

  @override
  bool operator ==(covariant HomeBottomNavigationMenu other) {
    if (identical(this, other)) return true;

    return other.icon == icon &&
        other.label == label &&
        other.count == count &&
        other.isShowNotification == isShowNotification;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        label.hashCode ^
        count.hashCode ^
        isShowNotification.hashCode;
  }
}
