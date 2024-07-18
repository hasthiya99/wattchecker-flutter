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

  factory Device.fromJson(Map<String, dynamic> json){
    return Device(
      modelNumber: json['modelNumber'],
      deviceName: json['deviceName'],
      imageUrl: json['imageUrl'],
      manufacturer: json['manufacturer'],
      deviceType: json['deviceType'],
      // powerRating: json['powerRating'],
      powerRatingPerYear: json['powerRatingPerYear'],
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
