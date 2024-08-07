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

  late TextEditingController modelNumberController;

  QRViewController? qrController;
  Barcode? result;

  bool bottomSheetOpen = false;

  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    modelNumberController = TextEditingController();
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
        if (!bottomSheetOpen) { // Check if modal bottom sheet is already showing
          setState(() {
            controller.pauseCamera();
            result = scanData;
            bottomSheetOpen = true; // Set flag to true
          });
          if(context.mounted) 
          {
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
                bottomSheetOpen = false; // Reset flag when modal bottom sheet is closed
              });
            });
          }
        }
      });
    }

    return Scaffold(
      appBar: const StandardAppBar(title: 'Scan Barcode'),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: ScreenSize().height(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: ScreenSize().width(context)*0.7,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Hold your phone steady and focus on the barcode',
                  style: TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400, color: textGrey),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
              
            Expanded(
              flex: 4,
              child: (cameraController == null || !cameraController!.value.isInitialized)?
                 const Center(child: CircularProgressIndicator(color: appBlack,)) :
               Stack(
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
                        padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05, vertical: 10),
                        child: IconButton(
                          onPressed: () async {
                            qrController?.flipCamera(); 
                          },
                          icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 30,),
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
                  onPressed: (){
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text('Enter model number manually', 
                          style: TextStyle(fontFamily: 'Lexend', fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        content: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: modelNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter model number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter model number',
                              hintStyle: TextStyle(fontFamily: 'Mulish', color: Color(0xFFB4BDC4), fontWeight: FontWeight.w500, fontSize: 14),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: appGrey)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appBlack)),
                            ),
                            cursorColor: appGrey,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style:const ButtonStyle(
                              foregroundColor: WidgetStatePropertyAll(appBlack),
                              overlayColor: WidgetStatePropertyAll(Color(0x11000000))  
                            ),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()){
                                qrController!.pauseCamera();
                                if (!bottomSheetOpen) { // Check if modal bottom sheet is already showing
                                  setState(() {
                                    bottomSheetOpen = true; // Set flag to true
                                  });
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.white,
                                    context: context, 
                                    builder: (context) {
                                      return DeviceDetailsBottomsheet(productId: modelNumberController.text);
                                    },
                                  ).whenComplete(() {
                                    if(context.mounted)
                                    {
                                      Navigator.pop(context);
                                      qrController!.resumeCamera();
                                      setState(() {
                                        bottomSheetOpen = false; // Reset flag when modal bottom sheet is closed
                                      });
                                    }
                                  });
                                }
                              }
                            },
                            style:const ButtonStyle(
                              foregroundColor: WidgetStatePropertyAll(appBlack),
                              overlayColor: WidgetStatePropertyAll(Color(0x11000000))  
                            ),
                            child: const Text('Submit'),
                          ),
                        ],
                      );
                    }).then((_) => qrController!.resumeCamera());
                  },
                  style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(appBlack),
                    overlayColor: WidgetStatePropertyAll(Color(0x11000000))  
                  ),
                  child: const Text('Enter model number manually'),
                )
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}