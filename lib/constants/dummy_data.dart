import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/models/scanned_device.dart';

Device rf29a9675ap = Device(
  deviceName: "BESPOKE 4-Door Flex",
  modelNumber: "RF29A9675AP",
  deviceType: "Refrigerator",
  manufacturer: "Samsung",
  imageUrl: "assets/images/rf29a9675ap.png",
  powerRatingPerYear: 704
);

Device rf32cg5400mtaa = Device(
  deviceName: "Mega Capacity 3-Door French Door",
  modelNumber: "RF32CG5400MTAA",
  deviceType: "Refrigerator",
  manufacturer: "Samsung",
  imageUrl: "assets/images/rf32cg5400mtaa.png",
  powerRatingPerYear: 785
);
Device gsb6181ds = Device(
  deviceName: "613L Dark Grapite Side-by-Side",
  modelNumber: "GS-B6181DS",
  deviceType: "Refrigerator",
  manufacturer: "LG",
  imageUrl: "assets/images/gsb6181ds.png",
  powerRatingPerYear: 569
);
Device qn85a = Device(
  deviceName: "85\" QN85A QLED 4K Smart TV",
  modelNumber: "QN85A",
  deviceType: "TV",
  manufacturer: "Samsung",
  imageUrl: "assets/images/qn85a.AVIF",
  powerRatingPerYear: 235
);

Device a90j = Device(
  deviceName: "65\" A90J OLED 4K HDR Smart TV",
  modelNumber: "A90J",
  deviceType: "TV",
  manufacturer: "Sony",
  imageUrl: "assets/images/a90j.webp",
  powerRatingPerYear: 210
);

Device lgdualinverter = Device(
  deviceName: "LG Dual Inverter Window Air Conditioner",
  modelNumber: "LW1517IVSM",
  deviceType: "Air Conditioner",
  manufacturer: "LG",
  imageUrl: "assets/images/lw1517ivsm.png",
  powerRatingPerYear: 600
);

Device blankDevice = Device(
  deviceName: "",
  modelNumber: "",
  deviceType: "",
  manufacturer: "",
  imageUrl: "",
  powerRatingPerYear: 0
);


List<ScannedDevice> scannedDevices = [
  // ScannedDevice(device: rf29a9675ap, scannedTime: DateTime.now(),),
  // ScannedDevice(device: rf32cg5400mtaa, scannedTime: DateTime.now()),
  // ScannedDevice(device: gsb6181ds, scannedTime: DateTime.now()),
  // ScannedDevice(device: qn85a, scannedTime: DateTime.now()),
  // ScannedDevice(device: a90j, scannedTime: DateTime.now()),
  // ScannedDevice(device: lgdualinverter, scannedTime: DateTime.now()),
];
