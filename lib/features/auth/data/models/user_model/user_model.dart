import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String uid;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final int age;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
    required this.gender,
    required this.age,
    required this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      age: map['age'] ?? 0,
      gender: map['gender'] ?? '',
      uid: map['uid'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'gender': gender,
      'uid': uid,
      'age': age,
      'image': image,
    };
  }
}
