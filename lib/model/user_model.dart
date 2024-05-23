class User {
  final String role;

  User({required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      role: json['role'],
    );
  }
}
