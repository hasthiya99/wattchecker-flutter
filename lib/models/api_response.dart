import 'package:dio/dio.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/screens/updateuser.dart';

class ResponseMessage {
  final bool success;
  final String message;

  ResponseMessage({required this.success, required this.message});
}

class ResponseDevice {
  final bool success;
  final int message;
  final Device device;

  ResponseDevice(
      {required this.success, required this.message, required this.device});
}

class ResponseScans {
  final bool success;
  final List<ScannedDevice> scannedDevices;

  ResponseScans({required this.success, required this.scannedDevices});
}
