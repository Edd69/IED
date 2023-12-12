import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_encryption/Screen/InfoScreen/MoreInfoScreen.dart';
import 'package:image_encryption/Screen/InfoScreen/privacy_srceen.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/applocal.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:image_encryption/Sharad/GetEmail.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    email() {
      OpenEmail.openEmail(
        toEmail: 'zkrt.diixz@gmail.com',
        subject: 'IED App',
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).translate('About_us'),
            style: TextStyle(
              color: BlackColor,
              fontSize: 25,
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
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Container(
                            child: Column(children: [
                          Image.asset('images/logo2.png'),
                        ])),
                      )),
                  SizedBox(height: 30),

                  ///MoreInfo Button 1
                  infoButton(
                    Title: AppLocalizations.of(context).translate('More_information'),
                    SubTitle: AppLocalizations.of(context).translate('information_SubTitle'),
                    icon: Icon(
                      Icons.info,
                      size: 38,
                      color: Color.fromARGB(255, 11, 61, 136),
                    ),
                    Fun: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MoreinfoScreen()));
                    },
                  ),

                  ///Contact Button 2
                  infoButton(
                    Title: AppLocalizations.of(context).translate('Contact_the_developer'),
                    SubTitle: AppLocalizations.of(context).translate('Contact_SubTitle'),
                    icon: Icon(
                      Icons.email,
                      size: 38,
                      color: Color.fromARGB(255, 11, 61, 136),
                    ),
                    Fun: () {
                      email();
                    },
                  ),

                  ///Acknowledge Button 3
                  infoButton(
                    Title: AppLocalizations.of(context).translate('Privacy_policy'),
                    SubTitle: AppLocalizations.of(context).translate('Privacy_policy_SubTitle'),
                    icon: Icon(
                      Icons.privacy_tip,
                      size: 38,
                      color: Color.fromARGB(255, 11, 61, 136),
                    ),
                    Fun: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => privacySrceen()));
                    },
                  ),

                  ///TextVersio
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 40),
                    child: Text(AppLocalizations.of(context).translate('Version_0.1'),
                      style: TextStyle(
                        color: WhiteColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ///NameOfDev
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('© 2023 IED | KSU_Group_2'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: WhiteColor,
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
