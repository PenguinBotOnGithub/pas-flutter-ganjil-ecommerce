import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int id;
  @HiveField(1)
  String username;
  @HiveField(2)
  String email;
  @HiveField(3)
  String firstName;
  @HiveField(4)
  String lastName;
  @HiveField(5)
  String gender;
  @HiveField(6)
  String image;
  @HiveField(7)
  String token;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"] as int,
        username: json["username"] as String,
        email: json["email"] as String,
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
        gender: json["gender"] as String,
        image: json["image"] as String,
        token: json["token"] as String);
  }

  @override
  String toString() {
    return """
"id": $id,
"username": $username,
"email": $email,
"firstName": $firstName,
"lastName": $lastName,
"gender": $gender,
"image": $image,
"token": $token
""";
  }
}
