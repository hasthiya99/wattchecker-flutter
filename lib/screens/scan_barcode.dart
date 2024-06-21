import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/appbar.dart';

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
  
  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
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
        setState(() {
          result = scanData;
        });
      });
    }

    return Scaffold(
      appBar: const StandardAppBar(title: 'Scan Barcode'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: ScreenSize().width(context)*0.7,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Hold your phone steady and focus on the barcode',
                style: TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ),
            
          Expanded(
            flex: 4,
            child: (cameraController == null || !cameraController!.value.isInitialized)?
               const Center(child: CircularProgressIndicator(color: appBlack,)) :
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
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${(result!.format).name}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          ),
          
        ],
      ),
    );
  }
}