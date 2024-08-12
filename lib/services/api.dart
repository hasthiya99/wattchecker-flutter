import 'package:dio/dio.dart';
import 'package:wattchecker/constants/api_paths.dart';
import 'package:wattchecker/constants/dummy_data.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/models/user.dart';
import 'package:wattchecker/services/shared_prefs.dart';
import 'package:wattchecker/widgets/gift_card.dart';

class Api {
  Future<ResponseMessage> login(String email, String password) async {
    try {
      Response response = await Dio()
          .post(loginUrl, data: {'email': email, 'password': password});

      if (response.statusCode == 200 && response.data['success'] == true) {
        SharedPrefs().setIntValue('id', response.data['userId']);
        SharedPrefs().setStringValue('firstName', response.data['firstName']);
        SharedPrefs().setStringValue('lastName', response.data['lastName']);
        SharedPrefs().setStringValue('email', response.data['email']);
        SharedPrefs().setStringValue('token', response.data['token']);
        SharedPrefs().setDoubleValue(
            'utilityRate', double.parse(response.data['utility']));
        SharedPrefs().setBoolValue('isLoggedIn', true);
        return ResponseMessage(
            success: true, message: response.data['message']);
      } else {
        return ResponseMessage(
            success: false, message: response.data['message']);
      }
    } on DioException catch (e) {
      return ResponseMessage(
          success: false, message: e.response!.data['message']);
    }
  }

  Future<ResponseMessage> signUp(String firstName, String lastName,
      String email, String zipCode, String utilityRate, String password) async {
    try {
      Response response = await Dio().post(signupUrl, data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'zipCode': zipCode,
        'utility': utilityRate
      });
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ResponseMessage(
            success: true, message: response.data['message']);
      } else {
        return ResponseMessage(
            success: false, message: response.data['message']);
      }
    } on DioException catch (e) {
      return ResponseMessage(
          success: false, message: e.response!.data['message']);
    }
  }

  Future<bool> checkToken() async {
    try {
      Response response = await Dio().get(checkTokenUrl,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SharedPrefs().getStringValue('token')}",
          }));
      if (response.statusCode == 200 && response.data['success'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioException {
      return false;
    }
  }

  Future<UserModel?> getUserById(int id) async {
    try {
      Response response = await Dio().get('$getUserUrl/$id');
      if (response.statusCode == 200 && response.data['success'] == true) {
        return UserModel.fromJson(response.data['user']);
      } else {
        return null;
      }
    } on DioException {
      return null;
    }
  }

  Future<ResponseMessage> sendOtp(String email) async {
    try {
      Response response = await Dio().post(sendOtpUrl, data: {'email': email});
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ResponseMessage(
            success: true, message: 'OTP sent to your email');
      } else {
        return ResponseMessage(success: false, message: 'Failed to send OTP');
      }
    } on DioException {
      return ResponseMessage(success: false, message: 'Failed to send OTP');
    }
  }

  Future<ResponseMessage> validateOtp(String email, String otp) async {
    try {
      Response response = await Dio()
          .post(validateOtpUrl, data: {'enteredOTP': otp, 'email': email});
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ResponseMessage(
            success: true, message: response.data['message']);
      } else {
        return ResponseMessage(
            success: false, message: response.data['message']);
      }
    } on DioException catch (e) {
      return ResponseMessage(
          success: false, message: e.response!.data['message']);
    }
  }

  Future<ResponseMessage> resetPassword(String email, String password) async {
    try {
      Response response = await Dio().put(resetPasswordUrl,
          data: {'email': email, 'newPassword': password});
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ResponseMessage(
            success: true, message: 'Password changed successfully');
      } else {
        return ResponseMessage(
            success: false, message: 'Failed to change password');
      }
    } on DioException {
      return ResponseMessage(
          success: false, message: 'Failed to change password');
    }
  }

  Future<ResponseMessage> addDevice(FormData data) async {
    try {
      Response response = await Dio().post(addDeviceUrl,
          data: data,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${SharedPrefs().getStringValue('token')}",
          }));

      if (response.statusCode == 201 && response.data['status'] == true) {
        return ResponseMessage(
            success: true, message: 'Device added successfully');
      } else {
        return ResponseMessage(success: false, message: 'Failed to add device');
      }
    } on DioException {
      return ResponseMessage(success: false, message: 'Failed to add device');
    }
  }

  Future<ResponseDevice> getDevice(String modelNumber) async {
    try {
      Response response = await Dio().get('$getDeviceUrl/$modelNumber');
      if (response.statusCode == 200 && response.data['status'] == true) {
        return ResponseDevice(
            success: true,
            message: response.statusCode!,
            device: Device.fromJson(response.data['result']));
      } else {
        return ResponseDevice(
            success: false, message: response.statusCode!, device: blankDevice);
      }
    } on DioException catch (e) {
      return ResponseDevice(
          success: false,
          message: e.response!.statusCode ?? 0,
          device: blankDevice);
    }
  }

  Future<ResponseMessage> addDeviceToAccount(int deviceId) async {
    try {
      Response response = await Dio().post(addDeviceToAccountUrl, data: {
        'userId': SharedPrefs().getIntValue('id'),
        'productId': deviceId
      });
      if (response.statusCode == 201 && response.data['status'] == true) {
        return ResponseMessage(success: true, message: 'Device saved');
      } else {
        return ResponseMessage(
            success: false, message: 'Failed to save device');
      }
    } on DioException {
      return ResponseMessage(success: false, message: 'Failed to save device');
    }
  }

  Future<ResponseScans> getScannedDevices() async {
    List<ScannedDevice> scannedDevices = [];
    try {
      Response response = await Dio()
          .get('$getSavedDevicesUrl/${SharedPrefs().getIntValue('id')}');
      if (response.statusCode == 200 && response.data['status'] == true) {
        List<dynamic> devicesJson = response.data['result'];
        scannedDevices =
            devicesJson.map((json) => ScannedDevice.fromJson(json)).toList();
        return ResponseScans(success: true, scannedDevices: scannedDevices);
      } else {
        return ResponseScans(success: false, scannedDevices: scannedDevices);
      }
    } on DioException {
      return ResponseScans(success: false, scannedDevices: scannedDevices);
    }
  }

  Future<List<Gift>> getAllGifts() async {
    try {
      Response response =
          await Dio().get('https://watch.hasthiya.org/gift/getAllGifts');
      if (response.statusCode == 200) {
        List<dynamic> giftsJson = response.data['result']['result'];
        return giftsJson.map((json) => Gift.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load gifts');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
