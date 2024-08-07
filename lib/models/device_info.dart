class Device{
  int productId;
  String modelNumber;
  String deviceName;
  String imageUrl;
  String manufacturer;
  String deviceType;
  //int? powerRating;  // This means the wattage of the device (in Watt)
  int powerRatingPerYear;  // This means the estimated energy consumption (in kilo Watt hour per year, or kWh/y)

  //Either one of powerRating or powerRatingPerYear or both must be provided

  Device({
    required this.productId,
    required this.modelNumber,
    required this.deviceName,
    required this.imageUrl,
    required this.manufacturer,
    required this.deviceType,
    //this.powerRating,
    required this.powerRatingPerYear,
  });

  factory Device.fromJson(Map<String, dynamic> json){
    return Device(
      productId: json['ProductID'],
      modelNumber: json['ModelNumber'],
      deviceName: json['Name'],
      imageUrl: json['proImage'].toString().replaceAll('"', '').replaceAll('[', '').replaceAll(']', ''),
      manufacturer: json['Brand'],
      deviceType: json['deviceType'],
      powerRatingPerYear: json['ProductWatt'],
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