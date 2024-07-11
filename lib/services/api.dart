import 'package:dio/dio.dart';
import 'package:wattchecker/constants/api_paths.dart';
import 'package:wattchecker/models/response_message.dart';
import 'package:wattchecker/services/shared_prefs.dart';

class Api {

  Future<ResponseMessage> login(String email, String password) async{
    try{
      Response response = await Dio().post(loginUrl, data: {
        'email' : email,
        'password' : password
      });

      if (response.statusCode == 200 && response.data['success'] == true){
        SharedPrefs().setStringValue('firstName', response.data['firstName']);
        SharedPrefs().setStringValue('token', response.data['token']);
        return ResponseMessage(success: true, message: response.data['message']);

      } else{
        return ResponseMessage(success: false, message: response.data['message']);
      }
    }
    on DioException catch(e){
      return ResponseMessage(success: false, message: e.response!.data['message'] );
    }
  }

  Future<ResponseMessage> signUp(String firstName, String lastName, String email, String zipCode, String utilityRate, String password) async{
    try{
      Response response = await Dio().post(signupUrl, data: {
        'email' : email,
        'password' : password,
        'firstName' :firstName,
        'lastName' :lastName,
        'zipCode' : zipCode,
        'utility' :utilityRate
      });
      if(response.statusCode == 200 && response.data['success']==true){
        return ResponseMessage(success: true, message: response.data['message']);
      } else{
        return ResponseMessage(success: false, message: response.data['message']);
      }
    } on DioException catch(e){
      return ResponseMessage(success: false, message: e.response!.data['message']);
    }
  }

}