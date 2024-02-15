class AppUser {
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final bool isAdmin;

  AppUser({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.isAdmin,
  });
}
