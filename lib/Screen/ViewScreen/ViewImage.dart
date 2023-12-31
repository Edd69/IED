import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:image_encryption/Screen/MainScreen/home_screen.dart';
import 'package:image_encryption/Sharad/adaptive_indicator.dart';
import 'package:image_encryption/Sharad/applocal.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_encryption/Sharad/constants.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

class ViewImage extends StatefulWidget {
  final plainPP;
  final keyPP;

  const ViewImage({Key key, this.plainPP, this.keyPP}) : super(key: key);
  @override
  State<ViewImage> createState() => _ViewImageState(this.plainPP, this.keyPP);
}

class _ViewImageState extends State<ViewImage> {
  ImagesProvider PROFULL = ImagesProvider();

  String tPath = 'null';

  _ViewImageState(plainPP, keyPP);

  Future<void> doAction() async {
    await Future.delayed(Duration(milliseconds: 900));
    String p = await PROFULL.runAfter(this.widget.plainPP, this.widget.keyPP);

    setState(() {
      tPath = p;
    });
  }
  @override
  void initState() {
    doAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ImagesProvider PRO = Provider.of<ImagesProvider>(context);

    saveImage() async {
      StatusAlert.show(
        context,
        duration: Duration(seconds: 4),
        title:  AppLocalizations.of(context).translate('Save'),
        subtitle:  AppLocalizations.of(context).translate('StatusAlert_Save_text'),
        configuration: IconConfiguration(icon: Icons.done),
        backgroundColor: WhiteColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      );
      await GallerySaver.saveImage(this.tPath); // save in Gallery
      await File(this.tPath).delete(); // delete temp
      await PRO.clear();
      Route route = MaterialPageRoute(builder: (context) => HomePage());
      await Navigator.pushReplacement(context, route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
           AppLocalizations.of(context).translate('IED'),
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
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
                  height: 30,
                ),
                  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Container(
                            child: Column(children: [
                          Image.asset('images/logo1.png'),
                        ])),
                      )),
                this.tPath == "null"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: AdaptiveIndicator(os: getOS()),
                            ),
                          ),
                        )),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image.file(
                          File(this.tPath),
                        ),
                      ),
                mainButton(
                    text: AppLocalizations.of(context).translate('Save'),
                    textSize: 25,
                    textColors: WhiteColor,
                    icon: Icon(
                      Icons.download_for_offline,
                      size: 37,
                      color: WhiteColor,
                    ),
                    backGround: Color.fromARGB(255, 85, 175, 90),
                    fun: saveImage),
                    Text(
                   AppLocalizations.of(context).translate('Keep_Image_Safe'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: WhiteColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
