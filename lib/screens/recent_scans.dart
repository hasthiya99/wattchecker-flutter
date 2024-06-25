import 'package:flutter/material.dart';
import 'package:wattchecker/constants/dummy_data.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/scanned_device.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/scanned_device_card.dart';

class RecentScans extends StatefulWidget {
  const RecentScans({super.key});

  @override
  State<RecentScans> createState() => _RecentScansState();
}

class _RecentScansState extends State<RecentScans> {

  List<ScannedDevice> devices = scannedDevices;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const FeaturePageAppBar(
          title: 'Recent Scans',
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context) * 0.05, vertical: 20.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenSize().width(context) * 0.05,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ScannedDeviceCard(
                      scannedDevice: devices[index],
                    );
                  },
                  childCount: devices.length,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
