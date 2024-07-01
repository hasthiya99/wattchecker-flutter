import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wattchecker/bar%20graph/bar_graph.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
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
    return Scaffold(
      appBar: const StandardAppBar(title: 'Compare Device'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
            child: Container(
              height: ScreenSize().height(context)*0.3,
              decoration: BoxDecoration(
                color: appGreen.withOpacity(0.08),
                borderRadius: const BorderRadius.all(Radius.circular(12))
              ),
              child: BarGraph(device_1: device_1, device_2: device_2, device_3: device_3,),
            ),
          )
        ],
      ),
    );
  }
}