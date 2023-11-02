class User {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  late Uri image;
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
        image: Uri.parse(json["image"] as String),
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
