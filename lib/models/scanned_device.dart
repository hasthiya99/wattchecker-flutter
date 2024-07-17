import 'package:wattchecker/models/device_info.dart';

// class ScannedDevice {
//   Device device;
//   DateTime scannedTime;

//   ScannedDevice({
//     required this.device,
//     required this.scannedTime,
//   });

//   factory ScannedDevice.fromJson(Map<String, dynamic> json) {
//     return ScannedDevice(
//       device: Device.fromJson(json['device'] as Map<String, dynamic>),
//       scannedTime: DateTime.parse(json['scannedTime'] as String),
//     );
//   }
// }

class ScannedDevice {
  Device device;
  DateTime scannedTime;

  ScannedDevice({
    required this.device,
    required this.scannedTime,
  });

  factory ScannedDevice.fromJson(Map<String, dynamic> json) {
    return ScannedDevice(
      device: Device.fromJson(json),
      scannedTime: DateTime.parse(json['createdAt'] as String),
    );
  }
}
