// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:wattchecker/constants/colors.dart';
// import 'package:wattchecker/constants/screensize.dart';
// import 'package:wattchecker/models/user.dart';
// import 'package:wattchecker/widgets/buttons.dart';

// class Updateuser extends StatefulWidget {
//   const Updateuser({super.key});

//   @override
//   State<Updateuser> createState() => _UpdateuserState();
// }

// class _UpdateuserState extends State<Updateuser> {
//   bool isLoading = false;
//   final formKey = GlobalKey<FormState>();

//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController zipCodeController = TextEditingController();
//   TextEditingController utilityRateController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();

//   final ApiService apiService = ApiService();

//   void _submit() async {
//     if (formKey.currentState?.validate() ?? false) {
//       setState(() {
//         isLoading = true;
//       });

//        UserModel user =  UserModel(
//         firstName: firstNameController.text,
//         lastName: lastNameController.text,
//         email: emailController.text,
//         zipCode:zipCodeController.text,
//         utility:utilityRateController.text,
//       );

//       await apiService.updateUser(
//           context, 'user-id', user as User); // Pass context here

//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: ScreenSize().width(context) * 0.05,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Edit Your account',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: appGreen,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Lorem Ipsum is simply dummy text.',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 14,
//                       color: textGrey,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 10.0),
//                           child: Text(
//                             'Name',
//                             style: TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textBlack,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 1,
//                               child: TextFormField(
//                                 controller: firstNameController,
//                                 decoration: InputDecoration(
//                                   hintText: 'First name',
//                                   hintStyle: const TextStyle(
//                                     fontFamily: 'Mulish',
//                                     fontSize: 12,
//                                     color: textGrey,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: appGrey),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: appGreen),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   errorBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   errorStyle: const TextStyle(height: 0),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               flex: 1,
//                               child: TextFormField(
//                                 controller: lastNameController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Last name',
//                                   hintStyle: const TextStyle(
//                                     fontFamily: 'Mulish',
//                                     fontSize: 12,
//                                     color: textGrey,
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: appGrey),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: appGreen),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20, vertical: 10),
//                                   errorBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   errorStyle: const TextStyle(height: 0),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 10.0),
//                           child: Text(
//                             'Email',
//                             style: TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textBlack,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your email',
//                             hintStyle: const TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textGrey,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: appGrey),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: appGreen),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             errorStyle: const TextStyle(height: 0),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 10.0),
//                           child: Text(
//                             'Zip code',
//                             style: TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textBlack,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           controller: zipCodeController,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your zip code',
//                             hintStyle: const TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textGrey,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: appGrey),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: appGreen),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             errorStyle: const TextStyle(height: 0),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 10.0),
//                           child: Text(
//                             'Utility Rate',
//                             style: TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textBlack,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           controller: utilityRateController,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your utility rate',
//                             hintStyle: const TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textGrey,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: appGrey),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: appGreen),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.red),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             errorStyle: const TextStyle(height: 0),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 10.0),
//                           child: Text(
//                             'Password',
//                             style: TextStyle(
//                               fontFamily: 'Mulish',
//                               fontSize: 12,
//                               color: textBlack,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),

//                         const SizedBox(height: 50),
//                         ButtonLong(
//                           onPressed: _submit,
//                           backgroundColor: appGreen,
//                           textColor: Colors.white,
//                           isLoading: isLoading,
//                           text: 'Submit',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ApiService {
//   final Dio _dio = Dio();

//   Future<void> updateUser(
//       BuildContext context, String userId, User user) async {
//     final String apiUrl = 'http://watch.hasthiya.org/user/updateUser/$userId';

//     try {
//       final response = await _dio.put(
//         apiUrl,
//         data: user.toJson(),
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('User updated successfully'),

//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to update user: ${response.statusCode}'),

//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }

// class User {
//   String firstName;
//   String lastName;
//   String email;

//   User({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//   });

//   // Convert a User into a Map object for JSON
//   Map<String, dynamic> toJson() => {
//         'firstName': firstName,
//         'lastName': lastName,
//         'email': email,
//       };

//   // Convert a Map object into a User object
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         firstName: json['firstName'],
//         lastName: json['lastName'],
//         email: json['email'],
//       );
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/user.dart';
import 'package:wattchecker/widgets/buttons.dart';

class Updateuser extends StatefulWidget {
  const Updateuser({super.key});

  @override
  State<Updateuser> createState() => _UpdateuserState();
}

class _UpdateuserState extends State<Updateuser> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController utilityRateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final ApiService apiService = ApiService();

  void _submit() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      // Convert utility rate to double
      double? utilityRate;
      try {
        utilityRate = double.parse(utilityRateController.text);
      } catch (e) {
        utilityRate = null;
      }

      // Handle null utilityRate case if needed
      UserModel user = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        zipCode: zipCodeController.text,
        utility: utilityRate ?? 0.0, // Provide a default value if null
      );

      await apiService.updateUser(
        context,
        'user-id', // Replace 'user-id' with actual user ID
        user,
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize().width(context) * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Edit Your account',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: appGreen,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem Ipsum is simply dummy text.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: textGrey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  hintText: 'First name',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 12,
                                    color: textGrey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: appGrey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: appGreen),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorStyle: const TextStyle(height: 0),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: lastNameController,
                                decoration: InputDecoration(
                                  hintText: 'Last name',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 12,
                                    color: textGrey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: appGrey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: appGreen),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorStyle: const TextStyle(height: 0),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textGrey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGrey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGreen),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorStyle: const TextStyle(height: 0),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Zip code',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: zipCodeController,
                          decoration: InputDecoration(
                            hintText: 'Enter your zip code',
                            hintStyle: const TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textGrey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGrey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGreen),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorStyle: const TextStyle(height: 0),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Utility Rate',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: utilityRateController,
                          decoration: InputDecoration(
                            hintText: 'Enter utility rate',
                            hintStyle: const TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textGrey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGrey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGreen),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorStyle: const TextStyle(height: 0),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonLong(
                          onPressed: _submit,
                          backgroundColor: appGreen,
                          textColor: Colors.white,
                          isLoading: isLoading,
                          text: 'Submit',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ApiService {
  final Dio _dio = Dio();

  Future<void> updateUser(
      BuildContext context, String userId, UserModel user) async {
    try {
      Response response = await _dio.put(
        'http://watch.hasthiya.org/user/updateUser/$userId',
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User updated successfully!')),
        );
      } else {
        // Handle non-200 responses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}
