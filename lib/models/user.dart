// class UserModel {
//   final int? id;
//   final String email;
//   final String firstName;
//   final String lastName;
//   final String zipCode;
//   final double utility;

//   UserModel({
//     this.id,
//     required this.email,
//     required this.firstName,
//     required this.lastName,
//     required this.zipCode,
//     required this.utility,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       email: json['email'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       zipCode: json['zipCode'],
//       utility: double.parse(json['utility']),
//     );
//   }
// }
class UserModel {
  final int? id;
  final String email;
  final String firstName;
  final String lastName;
  final String zipCode;
  final double utility;

  UserModel({
    this.id,
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
      utility: json['utility'] != null
          ? double.parse(json['utility'].toString())
          : 0.0, // Provide default if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'zipCode': zipCode,
      'utility': utility,
    };
  }
}
