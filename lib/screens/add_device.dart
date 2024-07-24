import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/services/image_helper.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';
import 'package:wattchecker/widgets/textbox.dart';

import '../services/api.dart';

class AddDevice extends StatefulWidget {
  final String? modelNumber;
  const AddDevice({super.key, this.modelNumber});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {

  final _formKey = GlobalKey<FormState>();
  bool edit = true;
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController modelNumberController = TextEditingController();
  final TextEditingController deviceTypeController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();
  final TextEditingController powerRatingController = TextEditingController();

  File? image;
  ImageHelper imageHelper = ImageHelper();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if(widget.modelNumber != null){
      modelNumberController.text = widget.modelNumber!.toUpperCase();
      edit = false;
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const StandardAppBar(title: 'Add device'),
        body: SingleChildScrollView(    
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ReusableTextBox(
                    hintText: 'Enter Model number',
                    title: 'Model number',
                    enabled: edit,
                    controller: modelNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),
                
                  ReusableTextBox(
                    hintText: 'Ex: QLED 4K Smart TV',
                    title: 'Device name',
                    controller: deviceNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),
          
                  ReusableTextBox(
                    hintText: 'Ex: TV',
                    title: 'Device type',
                    controller: deviceTypeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),
          
                  ReusableTextBox(
                    hintText: 'Ex: Sony',
                    title: 'Manufacturer',
                    controller: manufacturerController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),

                  ReusableTextBox(
                    hintText: 'Ex: 235',
                    title: 'Power rating per year (kWh/y)',
                    controller: powerRatingController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      final n = num.tryParse(value);
                      if (n == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          final file = await imageHelper.pickImage();
                          if(file != null){
                            final croppedFile = await imageHelper.crop(file: file);
                            if(croppedFile != null){
                              setState(() {
                                image = File(croppedFile.path);
                              });
                            }
                          }
                        }, 
                        style: TextButton.styleFrom(
                          foregroundColor: appGreen,
                        ),
                        child: const Text('Add image', style: TextStyle(color: textBlack),)
                      ),
                      const SizedBox(width: 20,),
                      if(image==null)SvgPicture.asset('assets/icons/error.svg', height: 30,)
                      else SvgPicture.asset('assets/icons/success.svg', height: 30,)
                    ],
                  ),
                  
                  const SizedBox(height: 40), // Add some spacing before the button
                  ButtonLong(
                    onPressed: (!isLoading)? ()async {
                      if (_formKey.currentState!.validate() && image!=null) {
                        setState(() {
                          isLoading = true;
                        });
                        List<int> imageBytes = await image!.readAsBytes();
                        FormData formData = FormData.fromMap(
                          {
                            'Name' : deviceNameController.text,
                            'Brand' : manufacturerController.text,
                            'ModelNumber' : modelNumberController.text,
                            'ProductWatt' : powerRatingController.text,
                            'deviceType' : deviceTypeController.text,
                            'proImage' : MultipartFile.fromBytes(
                              imageBytes,
                              filename: '${modelNumberController.text}.png',
                            )
                          }
                        );
                        ResponseMessage response = await Api().addDevice(formData);
                        if(context.mounted){
                          setState(() {
                            isLoading = false;
                          });
                          showSnackBar(context, response.message);
                          if(response.success){
                            Navigator.pop(context);
                          }
                        }
                      }
                    } : (){},
                    text: !isLoading? 'Submit' : '',
                    leading: isLoading? const SizedBox(
                            height: 25,
                            width: 25,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2,
                              ),
                            ),
                          ): null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
