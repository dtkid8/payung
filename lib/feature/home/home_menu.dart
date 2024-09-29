// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeMenu {
  final String name;
  final String icon;
  final bool isNew;
  HomeMenu({
    required this.name,
    required this.icon,
    required this.isNew,
  });

  HomeMenu copyWith({
    String? name,
    String? icon,
    bool? isNew,
  }) {
    return HomeMenu(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isNew: isNew ?? this.isNew,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'isNew': isNew,
    };
  }

  factory HomeMenu.fromMap(Map<String, dynamic> map) {
    return HomeMenu(
      name: map['name'] as String,
      icon: map['icon'] as String,
      isNew: map['isNew'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeMenu.fromJson(String source) => HomeMenu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Menu(name: $name, icon: $icon, isNew: $isNew)';

  @override
  bool operator ==(covariant HomeMenu other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.icon == icon &&
      other.isNew == isNew;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode ^ isNew.hashCode;
}
