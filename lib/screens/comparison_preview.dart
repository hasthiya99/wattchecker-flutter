import 'package:flutter/material.dart';
import 'package:wattchecker/models/device_info.dart';
import 'package:wattchecker/widgets/appbar.dart';

class ComparisonPreview extends StatefulWidget {
  final Device device_1;
  final Device device_2;
  final Device? device_3;
  const ComparisonPreview({super.key, required this.device_1, required this.device_2, this.device_3});

  @override
  State<ComparisonPreview> createState() => _ComparisonPreviewState();
}

class _ComparisonPreviewState extends State<ComparisonPreview> {

  late Device device_1;
  late Device device_2;
  late Device? device_3;

  void initDevices(){
    device_1 = widget.device_1;
    device_2 = widget.device_2;
    device_3 = widget.device_3;
  }

  @override
  void initState() {
    super.initState();
    initDevices();
  }
    
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StandardAppBar(title: 'Compare Device'),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}