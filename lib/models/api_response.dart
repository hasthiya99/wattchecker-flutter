import 'package:wattchecker/models/device_info.dart';

class ResponseMessage{
  final bool success;
  final String message;

  ResponseMessage({required this.success, required this.message});
}

class ResponseDevice{
  final bool success;
  final int message;
  final Device device;

  ResponseDevice({required this.success, required this.message, required this.device});
}