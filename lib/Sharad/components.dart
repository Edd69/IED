import 'package:flutter/material.dart';
import 'package:image_encryption/Sharad/Colors.dart';

Widget mainButton({
  @required Function fun,
  @required String text,
  @required Icon icon,
  @required Color backGround,
  double textSize = 27,
  Color textColors = Colors.white,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: ClipRRect(

        borderRadius: BorderRadius.circular(27),
        child: Container(
          width: 300,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: backGround,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(23.0),
                    primary: textColors,
                    textStyle: TextStyle(
                      fontSize: textSize,
                    ),
                  ),
                  onPressed: fun,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 70, end: 60),
                    child: Text(
                      text,
                      style: TextStyle(color: textColors),
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(20.0), child: icon),
            ],
          ),
        ),
      ),
    );

Widget infoButton({
  @required Function Fun,
  @required String Title,
  @required String SubTitle,
  @required Icon icon,
}) =>
    GestureDetector(
      onTap: Fun,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 3),
                      child: Text(
                        Title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff003366),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 3),
                      child: Text(
                        SubTitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: BlackColor.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
