import 'dart:io'; // Import for File
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wattchecker/services/shared_prefs.dart';
import 'package:wattchecker/models/user.dart';
import 'package:wattchecker/widgets/appbar.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late Future<UserModel?> userFuture;
  String? _imageUrl;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    userFuture = getUserDetails();
    _loadImage();
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

  Future<UserModel?> getUserDetails() async {
    try {
      // Retrieve user ID from shared preferences
      int? userId = await SharedPrefs().getIntValue('id');

      if (userId == null) {
        print('User ID is null');
        return null; // Handle case where user ID is not found
      }

      // Construct the API URL with the user ID
      String url = 'http://watch.hasthiya.org/user/getUser/$userId';
      print('Making request to URL: $url');

      // Make the API request
      Response response = await Dio().get(url);

      // Print the status code and response data
      print('Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200 && response.data['success'] == true) {
        // Access the nested 'user' data
        return UserModel.fromJson(response.data['user']);
      } else {
        print('Error in response: ${response.data}');
        return null; // Handle error case
      }
    } on DioException catch (e) {
      print('Error fetching user details: ${e.message}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithoutSearch(
        title: 'Profile',
      ),
      body: FutureBuilder<UserModel?>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            UserModel? user = snapshot.data;
            return user != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Add CircleAvatar here
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _imageUrl != null
                                ? FileImage(File(_imageUrl!))
                                : AssetImage('assets/images/pfp.png')
                                    as ImageProvider,
                          ),
                        ),
                        SizedBox(
                            height: 16), // Space between avatar and details
                        Text(
                          'First Name:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          '${user.firstName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Last Name:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          '${user.lastName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Email:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          '${user.email}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Inter',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Zipcode:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          '${user.zipCode}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Utility Rate:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Text(
                          '${user.utility}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(child: Text('No user data available.'));
          } else {
            return Center(child: Text('No user data available.'));
          }
        },
      ),
    );
  }
}
