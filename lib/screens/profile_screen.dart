import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/models/user.dart';
import 'package:wattchecker/screens/updateuser.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// class _ProfileScreenState extends State<ProfileScreen> {
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

//       // Convert utility rate to double
//       double? utilityRate;
//       try {
//         utilityRate = double.parse(utilityRateController.text);
//       } catch (e) {
//         utilityRate = null;
//       }

//       // Handle null utilityRate case if needed
//       UserModel user = UserModel(
//         firstName: firstNameController.text,
//         lastName: lastNameController.text,
//         email: emailController.text,
//         zipCode: zipCodeController.text,
//         utility: utilityRate ?? 0.0, // Provide a default value if null
//       );

//       await apiService.updateUser(
//         context,
//         'user-id', // Replace 'user-id' with actual user ID
//         user,
//       );

//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   final ImagePicker picker = ImagePicker();
//   String? _imageUrl;
//   late double screenWidth;
//   late SharedPreferences _prefs;

//   @override
//   void initState() {
//     super.initState();
//     _loadImage(); // Load the saved image when the app starts
//   }

//   // Load the saved image path from SharedPreferences
//   Future<void> _loadImage() async {
//     _prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _imageUrl = _prefs.getString('profile_picture');
//     });
//   }

//   Future<void> _updateProfilePicture(String path) async {
//     await _prefs.setString('profile_picture', path);
//     setState(() {
//       _imageUrl = path;
//     });

//     // Save to SharedPreferences for other parts of the app to access
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('imageUrl', path);
//   }

//   // Save the image path to SharedPreferences and update the UI
//   // Future<void> _updateProfilePicture(String path) async {
//   //   await _prefs.setString('profile_picture', path);
//   //   setState(() {
//   //     _imageUrl = path;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Update Profile',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Inter',
//             ),
//           ),
//         ),
//         backgroundColor: Colors.green,
//         centerTitle: false,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(30),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 10),
//             Stack(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: _imageUrl != null
//                       ? FileImage(File(_imageUrl!))
//                       : AssetImage('assets/images/pfp.png') as ImageProvider,
//                 ),
//                 //_imageUrl == null

//                 // ? ClipOval(
//                 //     child: Image.asset(
//                 //       'assets/images/pfp.png', // Default image
//                 //       width: 80,
//                 //       height: 80,
//                 //       fit: BoxFit.cover,
//                 //     ),
//                 //   )
//                 // : ClipOval(
//                 //     child: Image.file(
//                 //       File(_imageUrl!),
//                 //       width: 80,
//                 //       height: 80,
//                 //       fit: BoxFit.cover,
//                 //     ),
//                 //   ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: GestureDetector(
//                     onTap: () {
//                       showImagePicker(context);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black26,
//                       ),
//                       child: const Icon(
//                         Icons.camera_alt,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             // Flexible(
//             //   child: ElevatedButton(
//             //     style: ButtonStyle(
//             //       backgroundColor: MaterialStateProperty.all<Color>(
//             //           const Color.fromARGB(255, 234, 217, 217)),
//             //       overlayColor: MaterialStateProperty.all(
//             //           const Color.fromARGB(0, 90, 88, 88)),
//             //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             //         RoundedRectangleBorder(
//             //           borderRadius: BorderRadius.circular(5.0),
//             //         ),
//             //       ),
//             //     ),
//             //     onPressed: () {
//             //       Navigator.push(context,
//             //           MaterialPageRoute(builder: (context) => Updateuser()));
//             //     },
//             //     child: const Text(
//             //       'Edit',
//             //       style: TextStyle(color: Colors.black),
//             //     ),
//             //   ),
//             // ),
//             Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     child: Text(
//                       'Name',
//                       style: TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textBlack,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: TextFormField(
//                           controller: firstNameController,
//                           decoration: InputDecoration(
//                             hintText: 'First name',
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
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         flex: 1,
//                         child: TextFormField(
//                           controller: lastNameController,
//                           decoration: InputDecoration(
//                             hintText: 'Last name',
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
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     child: Text(
//                       'Email',
//                       style: TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textBlack,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your email',
//                       hintStyle: const TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textGrey,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: appGrey),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: appGreen),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorStyle: const TextStyle(height: 0),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     child: Text(
//                       'Zip code',
//                       style: TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textBlack,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     controller: zipCodeController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your zip code',
//                       hintStyle: const TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textGrey,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: appGrey),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: appGreen),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorStyle: const TextStyle(height: 0),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     child: Text(
//                       'Utility Rate',
//                       style: TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textBlack,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     controller: utilityRateController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter utility rate',
//                       hintStyle: const TextStyle(
//                         fontFamily: 'Mulish',
//                         fontSize: 12,
//                         color: textGrey,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: appGrey),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: appGreen),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       errorStyle: const TextStyle(height: 0),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ButtonLong(
//                     onPressed: _submit,
//                     backgroundColor: appGreen,
//                     textColor: Colors.white,
//                     isLoading: isLoading,
//                     text: 'Submit',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // Other widgets...
//       ),
//     );
//   }

//   void showImagePicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Photo Library'),
//                 onTap: () {
//                   _imgFromGallery();
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   _imgFromCamera();
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _imgFromGallery() async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
//     if (pickedFile != null) {
//       _updateProfilePicture(pickedFile.path);
//     } else {
//       print('No image selected.');
//     }
//   }

//   Future<void> _imgFromCamera() async {
//     final pickedFile =
//         await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
//     if (pickedFile != null) {
//       _updateProfilePicture(pickedFile.path);
//     } else {
//       print('No image captured.');
//     }
//   }
// }

// class ApiService {
//   final Dio _dio = Dio();

//   Future<void> updateUser(
//       BuildContext context, String userId, UserModel user) async {
//     try {
//       Response response = await _dio.put(
//         'http://watch.hasthiya.org/user/updateUser/$userId',
//         data: user.toJson(),
//       );

//       if (response.statusCode == 200) {
//         // Handle successful response
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('User updated successfully!')),
//         );
//       } else {
//         // Handle non-200 responses
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.statusCode}')),
//         );
//       }
//     } catch (e) {
//       // Handle exceptions
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     }
//   }
// }
class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController utilityRateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  String? _imageUrl;
  late double screenWidth;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadImage(); // Load the saved image when the app starts
  }

  // Load the saved image path from SharedPreferences
  Future<void> _loadImage() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageUrl = _prefs.getString('profile_picture');
    });
  }

  Future<void> _updateProfilePicture(String path) async {
    await _prefs.setString('profile_picture', path);
    setState(() {
      _imageUrl = path;
    });
  }

  Future<int?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  Future<void> _updateUserProfile() async {
    setState(() {
      isLoading = true;
    });

    try {
      int? userId = await _getUserId();
      if (userId == null) {
        throw Exception("User cannot found. Please log in");
      }

      Response response = await Dio().put(
        'http://watch.hasthiya.org/user/updateUser/$userId',
        data: {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'zipCode': zipCodeController.text,
          'utilityRate': utilityRateController.text,
        },
      );

      // Print the response status code and data
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      // Check the response structure
      if (response.statusCode == 200 &&
          response.data['result'] != null &&
          response.data['result']['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Profile updated successfully'),
        ));
      } else {
        // Access the message in the nested 'result' key
        String message = response.data['result']['message'] ?? 'Unknown error';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to update profile: $message'),
        ));
      }
    } catch (e) {
      print('Error occurred: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.toString()}'),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _submit() {
    if (formKey.currentState?.validate() ?? false) {
      _updateUserProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarWithoutSearch(
        title: 'Update UserProfile',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: _imageUrl != null
                      ? FileImage(File(_imageUrl!))
                      : AssetImage('assets/images/pfp.png') as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      showImagePicker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black26,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First name cannot be empty';
                            }
                            if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'First name cannot be only numbers';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Last name cannot be empty';
                            }
                            if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Last name cannot be only numbers';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: zipCodeController,
                    decoration: InputDecoration(
                      hintText: 'Zip Code',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Zip Code cannot be empty';
                      }
                      if (RegExp(r'^[^0-9]+$').hasMatch(value)) {
                        return 'Zip Code must be a number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
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
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      _updateProfilePicture(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _imgFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      _updateProfilePicture(pickedFile.path);
    } else {
      print('No image captured.');
    }
  }
}
