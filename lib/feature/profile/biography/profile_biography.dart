// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileBiography {
  final String name;
  final String birthdate;
  final String gender;
  final String email;
  final String phone;
  final String education;
  final String status;
  ProfileBiography({
    required this.name,
    required this.birthdate,
    required this.gender,
    required this.email,
    required this.phone,
    required this.education,
    required this.status,
  });

  ProfileBiography copyWith({
    String? name,
    String? birthdate,
    String? gender,
    String? email,
    String? phone,
    String? education,
    String? status,
  }) {
    return ProfileBiography(
      name: name ?? this.name,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      education: education ?? this.education,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birthdate': birthdate,
      'gender': gender,
      'email': email,
      'phone': phone,
      'education': education,
      'status': status,
    };
  }

  factory ProfileBiography.fromMap(Map<String, dynamic> map) {
    return ProfileBiography(
      name: map['name'] as String,
      birthdate: map['birthdate'] as String,
      gender: map['gender'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      education: map['education'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileBiography.fromJson(String source) =>
      ProfileBiography.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileBiography(name: $name, birthdate: $birthdate, gender: $gender, email: $email, phone: $phone, education: $education, status: $status)';
  }

  @override
  bool operator ==(covariant ProfileBiography other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.birthdate == birthdate &&
        other.gender == gender &&
        other.email == email &&
        other.phone == phone &&
        other.education == education &&
        other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        birthdate.hashCode ^
        gender.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        education.hashCode ^
        status.hashCode;
  }
}
