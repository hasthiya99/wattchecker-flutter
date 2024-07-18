class Device {
  String modelNumber;
  String deviceName;
  String imageUrl;
  String manufacturer;
  String deviceType;
  int powerRatingPerYear;

  Device({
    required this.modelNumber,
    required this.deviceName,
    required this.imageUrl,
    required this.manufacturer,
    required this.deviceType,
    required this.powerRatingPerYear,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      modelNumber: json['ModelNumber'],
      deviceName: json['Name'],
      imageUrl: json['proImage'].toString().replaceAll('"', '').replaceAll('[', '').replaceAll(']', ''),
      manufacturer: json['Brand'],
      deviceType: json['deviceType'],
      powerRatingPerYear: json['EnergyConsumption'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Device) return false;
    return modelNumber == other.modelNumber;
  }

  @override
  int get hashCode => modelNumber.hashCode;
  
}
