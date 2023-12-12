import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/ViewScreen/ViewImage.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/applocal.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';

class DecryptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ImagesProvider PRO = Provider.of<ImagesProvider>(context);

    Future<void> run() async {
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewImage(
                plainPP: PRO.getImagePlainPath,
                keyPP: PRO.getImageKeyPath,
              )));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('DECRYPT_ap'),
          style: TextStyle(
            color: BlackColor,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: BlackColor,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              BoxBackgroundColor0,
              BoxBackgroundColor1,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context).translate('Encrypted_Image'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: WhiteColor,
                    fontSize: 25,
                  ),
                ),
                Container(
                    width: 360,
                    height: 260,
                    color: Colors.white.withOpacity(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                            PRO.pickImage('plain', ImageSource.gallery);
                          },
                          child: PRO.isImagePlainPicked
                              ? Image.file(File(PRO.getImagePlainPath),
                                  height: 240, width: 340, fit: BoxFit.contain)
                              : Icon(
                                  Icons.camera_alt,
                                  size: 120,
                                  color: WhiteColor.withOpacity(.9),
                                ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context).translate('Key_Image'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: WhiteColor,
                    fontSize: 25,
                  ),
                ),
                Container(
                    width: 360,
                    height: 260,
                    color: Colors.white.withOpacity(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () => {
                             PRO.pickImage('key', ImageSource.gallery),
                          },
                          child: PRO.isImageKeyPicked
                              ? Image.file(File(PRO.getImageKeyPath),
                                  height: 240, width: 340, fit: BoxFit.contain)
                              : Icon(
                                  Icons.camera_alt,
                                  size: 120,
                                  color: WhiteColor.withOpacity(.9),
                                ),
                        ),
                      ],
                    )),
                Container(
                  child: PRO.isImageKeyPicked && PRO.isImagePlainPicked
                      ? mainButton(
                          backGround: DecryptButtonColor.withOpacity(1),
                          fun: run,
                          text: AppLocalizations.of(context).translate('Decrypt'),
                          textSize: 27.5,
                          icon: Icon(
                            Icons.lock_open,
                            color: Colors.white,
                            size: 36.0,
                          ),
                        )
                      : SizedBox(height: 10),
                ),
                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
