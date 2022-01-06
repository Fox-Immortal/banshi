import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/presentation_layer/widgets/log_side_widgets/option_button.dart';

class LoginOptionScreen extends StatefulWidget {
  const LoginOptionScreen({Key? key}) : super(key: key);

  @override
  _LoginOptionScreenState createState() => _LoginOptionScreenState();
}

class _LoginOptionScreenState extends State<LoginOptionScreen> {
  String animation = "assets/animation/lf20_bbwsvl4m.json";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      color: MyColors.myWhite,
      child: Scaffold(
        backgroundColor: MyColors.myWhite,
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/hh.jpg"),
            fit: BoxFit.fitHeight,
          )),
          child: Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400.withOpacity(0.5)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height*0.1,
                        ),
                       SizedBox(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width,
                                height: height * 0.09,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/panshiLogo.png"),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height*0.54,
                        ),
                        SizedBox(
                          width: width,
                          height: height * 0.25,
                          child: logOptionSection(width, height),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logOptionSection(double width, double height) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: width * 0.8,
              height: height*0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: MyColors.myBlack),
              child: logOptionButton(width, height, MyColors.myWhite,
                  MyColors.myWhite, MyColors.myWhite, "Log In", 0)),
          SizedBox(
            height: height*0.01,
          ),
          Container(
              width: width * 0.8,
            height: height*0.06,

            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: MyColors.myWhite),
              child:  logOptionButton(width, height, MyColors.myBlack, MyColors.myBlack,
                  MyColors.myWhite, "Create Account", 1),
          ),

        ],
      ),
    );
  }

  Widget logOptionButton(double width, double height, Color primaryColor,
      Color onPrimaryColor, Color shadowColor, String text, int type) {
    return SizedBox(
      child: TextButton(
        onPressed: () {
          type == 0
              ? modelBottomSheet(width, height)
              : Navigator.pushNamed(context, '/createAccount');
        },
        child: Text(text,
            style: TextStyle(
              fontSize: height * 0.025,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            )),
      ),
    );
  }

  void modelBottomSheet(double width, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(30),
        )),
        context: context,
        builder: (context) {
          return Container(
            height: height * 0.25,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OptionButton(
                  optionText: "E-mail Login",
                  optionIcon: Icons.email,
                  optionType: 0,
                ),
                SizedBox(
                  height: 20,
                ),
                OptionButton(
                  optionText: "Google Login",
                  optionIcon: FontAwesomeIcons.google,
                  optionType: 1,
                )
              ],
            ),
          );
        });
  }
}
