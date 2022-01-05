class User {
  late final String username;
  late final String fullName;
  late final String password;

  User({
    required this.username,
    required this.fullName,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'username': username,
        'fullName': fullName,
        'password': password,
      };
}
