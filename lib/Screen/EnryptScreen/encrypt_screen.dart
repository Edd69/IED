import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/ViewScreen/ViewImage.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/applocal.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

class EncryptScreen extends StatelessWidget {
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
          AppLocalizations.of(context).translate('ENCRYPT_ap'),
          style: TextStyle(
            color: BlackColor,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
                SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context).translate('Plain_Image'),
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
                  ),
                ),
                PRO.isImageKeyPicked && PRO.isImagePlainPicked
                    ? mainButton(
                        backGround: EncryptButtonColor,
                        text: AppLocalizations.of(context).translate('Encrypt1'),
                        icon: Icon(
                          Icons.lock,
                          color: WhiteColor,
                          size: 36.0,
                        ),
                        fun: () {
                          PRO.isImageKeyLargerThanPlain()
                              ? run()
                              : StatusAlert.show(
                                  context,
                                  duration: Duration(seconds: 5),
                                  title: AppLocalizations.of(context).translate('StatusAlert_title'),
                                  subtitle:
                                      AppLocalizations.of(context).translate('StatusAlert_text'),
                                  configuration:
                                      IconConfiguration(icon: Icons.error),
                                  backgroundColor: WhiteColor,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  dismissOnBackgroundTap: true,
                                );
                        },
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
