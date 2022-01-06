import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/web_services/email_services/email_services.dart';
import 'package:panshi/presentation_layer/widgets/log_side_widgets/field_box.dart';
import 'package:panshi/presentation_layer/widgets/log_side_widgets/option_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.18,
              decoration: const BoxDecoration(
                color: MyColors.myBlack,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60)),
              ),
              child: Center(
                child: Container(
                  width: width,
                  height: height * 0.09,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/panshiLogo2.png"),
                  )),
                ),
              ),
            ),
            Container(
              height: height * 0.84,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    height: height * 0.73,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: MyColors.myWhite,
                        border: Border.all(color: MyColors.myWhite, width: 0),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                        child: registrationForm(width, height)),
                  ),
                  Container(
                    color: MyColors.myWhite,
                    child: Container(
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: MyColors.myBlack,
                        border: Border.all(color: MyColors.myBlack, width: 0),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(60)),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have account ?",
                                style: TextStyle(
                                    color: MyColors.myWhite,
                                    fontSize: height * 0.025,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: height * 0.04,
                                width: width * 0.19,
                                child: ElevatedButton(
                                    onPressed: () {
                                      modelBottomSheet(width, height);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        elevation: 5,
                                        shadowColor: MyColors.myWhite),
                                    child: FittedBox(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: MyColors.myBlack,
                                            fontSize: height * 0.025,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget registrationForm(double width, double height) {
    return SizedBox(
      width: width,
      // color: Colors.white,
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Registration",
              style: TextStyle(
                  color: MyColors.myBlack,
                  fontSize: height * 0.03,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height:10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FieldBox(
                  width: width * 0.425,
                  height: height * 0.13,
                  boxName: "First Name",
                  boxHint: "First Name",
                  boxController: firstNameController,
                  readOnly: false,
                  onTab: () {},
                  maxLines: 1,
                  fieldType: 'userName',
                ),
                const SizedBox(
                  width: 2,
                ),
                FieldBox(
                  width: width * 0.425,
                  height: height * 0.13,
                  boxName: "Second Name",
                  boxHint: "Second Name",
                  boxController: secondNameController,
                  fieldType: 'userName',
                  maxLines: 1,
                  onTab: () {},
                  readOnly: false,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            FieldBox(
              width: width,
              height: height * 0.14,
              boxName: "Email",
              boxHint: "Enter email like abs@gmail.com",
              boxController: emailController,
              readOnly: false,
              onTab: () {},
              maxLines: 1,
              fieldType: 'email',
            ),
            const SizedBox(
              height: 5,
            ),
            FieldBox(
              width: width,
              height: height * 0.14,
              boxName: "Phone Number",
              boxHint: "Enter phone number like +962*********",
              boxController:phoneController,
              fieldType: 'phone',
              maxLines: 1,
              onTab: () {},
              readOnly: false,
            ),
            const SizedBox(
              height: 5,
            ),
            FieldBox(
              width: width,
              height: height * 0.14,
              boxName: "Password",
              boxHint: "Enter password has at least 1 capital letter",
              boxController: passwordController,
              readOnly: false,
              onTab: () {},
              maxLines: 1,
              fieldType: 'password',
            ),

            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: height * 0.06,
                width: width,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      EmailSignServices().registration(
                          context: context,
                          password: passwordController.text.trim(),
                          name: firstNameController.text.trim() +
                              " " +
                              secondNameController.text.trim(),
                          email: emailController.text.trim(),
                          phone: phoneController.text.trim());
                    } else {}

                  },
                  style: ElevatedButton.styleFrom(
                      primary: MyColors.myBlack,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: MyColors.myWhite,
                      fontSize: height * 0.025,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20,),
            buildFoot(width, height),
          ],
        ),
      ),
    );
  }

  Widget pressBox(
    double width,
    double height,
    String boxName,
  ) {
    return FittedBox(
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.3,
              width: width,
              child: Text(
                boxName,
                style: TextStyle(
                    color: MyColors.myBlack,
                    fontSize: height * 0.3,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: height * 0.5,
              width: width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    padding: EdgeInsets.zero),
                child: Row(
                  children: [
                    Text(
                      "Press Here",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: height * 0.25,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFoot(double width, double height) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            'By registering, you agree to our',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black54,
              fontSize: height * 0.025,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Terms and Privacy Policy',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: MyColors.myBlack,
                fontSize: height * 0.025,
              ),
            ),
          ),
        ],
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
