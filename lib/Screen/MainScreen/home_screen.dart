import 'package:flutter/material.dart';
import 'package:image_encryption/Screen/EnryptScreen/encrypt_screen.dart';
import 'package:image_encryption/Screen/infoScreen/information_screen.dart';
import 'package:image_encryption/Sharad/Colors.dart';
import 'package:image_encryption/Sharad/applocal.dart';
import 'package:image_encryption/Sharad/components.dart';
import 'package:provider/provider.dart';
import 'package:image_encryption/Sharad/Proivder/ImagesProivderClass.dart';
import 'package:image_encryption/Screen/DecryptScreen/decrypt_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var PRO = Provider.of<ImagesProvider>(context);

    void encrypt() async {
      PRO.clear();
      PRO.setTypeOfAction('Encrypt');
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => EncryptScreen()));
    }

    void decrypt() async {
      PRO.clear();
      PRO.setTypeOfAction('Decrypt');
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DecryptScreen()));
    }

    return  Scaffold(
        appBar: homeAppBar(context),
        body: Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Container(child: Image.asset('images/logo2.png')),
                  ),
                ),
                mainButton(
                  backGround: EncryptButtonColor,
                  text: AppLocalizations.of(context).translate('Encrypt'),
                  textSize: 27.5,
                  icon: Icon(
                    Icons.lock,
                    color: WhiteColor,
                    size: 36.0,
                  ),
                  fun: () {
                    encrypt();
                  },
                ),
                mainButton(
                  backGround: DecryptButtonColor.withOpacity(1),
                  fun: () {
                    decrypt();
                  },
                  text: AppLocalizations.of(context).translate('Decrypt'),
                  textSize: 27.5,
                  icon: Icon(
                    Icons.lock_open,
                    color: WhiteColor,
                    size: 36.0,
                  ),
                ),
                mainButton(
                    fun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationScreen(),
                        ),
                      );
                    },
                    text: AppLocalizations.of(context).translate('About_us'),
                    textSize: 26.5,
                    icon: Icon(
                      Icons.group,
                      color: WhiteColor,
                      size: 36.0,
                    ),
                    backGround: AboutButtonColor.withOpacity(1)),
              ],
            ),
          ),
        ),
      );
    
  }

  AppBar homeAppBar(var context) {
    return AppBar(
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
      automaticallyImplyLeading: false,
    );
  }
}
