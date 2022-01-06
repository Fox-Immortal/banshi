import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/presentation_layer/widgets/log_side_widgets/log_option_button.dart';

class LogOptionScreen1 extends StatefulWidget {
  const LogOptionScreen1({Key? key}) : super(key: key);

  @override
  _LogOptionScreen1State createState() => _LogOptionScreen1State();
}

class _LogOptionScreen1State extends State<LogOptionScreen1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/hh.jpg"),
          fit: BoxFit.fitHeight,
        )),
        child: Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: height * 0.2,
                        child: Container(
                          width: width,
                          height: height * 0.1,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/panshiLogo2.png"),
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width,
                              height: height * 0.09,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage("assets/images/panshiLogo.png"),
                              )),
                            ),
                            SizedBox(
                              height: height * 0.45,
                            ),
                            LogOptionButton(width: width, height: height, context: context, text: "Log In", type: 1, primary: MyColors.myBlack, onPrimary: MyColors.myWhite),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            LogOptionButton(width: width, height: height, context: context, text: "Sign Up", type: 2, primary: MyColors.myWhite, onPrimary: MyColors.myBlack),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
