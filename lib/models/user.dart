class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String zipCode;
  final double utility;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.zipCode,
    required this.utility,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      zipCode: json['zipCode'],
      utility: double.parse(json['utility']),
    );
  }
}
