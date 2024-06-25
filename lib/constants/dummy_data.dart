
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/widgets/productcard.dart';

Device rf29a9675ap = Device(
  deviceName: "BESPOKE 4-Door Flex",
  modelNumber: "rf29a9675ap",
  deviceType: "Refrigerator",
  manufacturer: "Samsung",
  imageUrl: "assets/images/rf29a9675ap.png",
  powerRatingPerYear: 704
);

Device rf32cg5400mtaa = Device(
  deviceName: "Mega Capacity 3-Door French Door",
  modelNumber: "rf32cg5400mtaa",
  deviceType: "Refrigerator",
  manufacturer: "Samsung",
  imageUrl: "assets/images/rf32cg5400mtaa.png",
  powerRatingPerYear: 785
);
Device gsb6181ds = Device(
  deviceName: "613L Dark Grapite Side-by-Side",
  modelNumber: "gs-b6181ds",
  deviceType: "Refrigerator",
  manufacturer: "LG",
  imageUrl: "assets/images/gsb6181ds.png",
  powerRatingPerYear: 569
);

List<Device> deviceList = []; 

List<Device> database = [rf29a9675ap, rf32cg5400mtaa, gsb6181ds];


List<ProductCard> getDummyProducts() {
    return [
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/mobilephone.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/fridgenew.jpg',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/laptop.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/headset.webp',
        scanDate: DateTime.now(),
      ),
      ProductCard(
        productName: 'Product name',
        imageUrl: 'assets/images/tablet.jpg',
        scanDate: DateTime.now(),
      ),
    ];
  }