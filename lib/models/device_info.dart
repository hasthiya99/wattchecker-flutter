class Device{
  String modelNumber;
  String deviceName;
  String imageUrl;
  String manufacturer;
  String deviceType;
  //int? powerRating;  // This means the wattage of the device (in Watt)
  int powerRatingPerYear;  // This means the estimated energy consumption (in kilo Watt hour per year, or kWh/y)

  //Either one of powerRating or powerRatingPerYear or both must be provided

  Device({
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
      modelNumber: json['ModelNumber'],
      deviceName: json['Name'],
      imageUrl: json['proImage'],
      manufacturer: json['Brand'],
      deviceType: json['deviceType'],
      powerRatingPerYear: json['EnergyConsumption'],
    );
  }
}