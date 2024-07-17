import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/device_details_bottomsheet.dart';

class ScanBarcode extends StatefulWidget {
  const ScanBarcode({super.key});

  @override
  State<ScanBarcode> createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  CameraController? cameraController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? qrController;
  Barcode? result;

  bool bottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      if (!mounted) return;
      if (cameras.isNotEmpty) {
        cameraController = CameraController(cameras[0], ResolutionPreset.high);
        cameraController!.initialize().then((_) {
          if (!mounted) return;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onQRViewCreated(QRViewController controller) {
      setState(() {
        qrController = controller;
      });
      controller.scannedDataStream.listen((scanData) {
        if (!bottomSheetOpen) {
          // Check if modal bottom sheet is already showing
          setState(() {
            controller.pauseCamera();
            result = scanData;
            bottomSheetOpen = true; // Set flag to true
          });
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return DeviceDetailsBottomsheet(productId: result?.code ?? '');
            },
          ).whenComplete(() {
            controller.resumeCamera();
            setState(() {
              bottomSheetOpen =
                  false; // Reset flag when modal bottom sheet is closed
            });
          });
        }
      });
    }

    return Scaffold(
      appBar: const StandardAppBar(title: 'Scan Barcode'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: ScreenSize().width(context) * 0.7,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Hold your phone steady and focus on the barcode',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: textGrey),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: (cameraController == null ||
                    !cameraController!.value.isInitialized)
                ? const Center(
                    child: CircularProgressIndicator(
                    color: appBlack,
                  ))
                : Stack(
                    children: [
                      QRView(
                        key: qrKey,
                        onQRViewCreated: onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                          borderColor: appWhite,
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: 300,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize().width(context) * 0.05,
                              vertical: 10),
                          child: IconButton(
                            onPressed: () async {
                              qrController?.flipCamera();
                            },
                            icon: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/DetailsEnterScreen');
              },
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(appBlack),
                  overlayColor: MaterialStatePropertyAll(Color(0x11000000))),
              child: const Text('Enter model number manually'),
            )),
          ),
        ],
      ),
    );
  }
}
