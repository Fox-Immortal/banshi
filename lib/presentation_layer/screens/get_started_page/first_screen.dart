import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextStyle boldTextStyle = TextStyle(
        color: MyColors.myBlack,
        fontSize: height * 0.045,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600);
    TextStyle normalTextStyle = TextStyle(
        color: MyColors.myBlack,
        fontSize: height * 0.025,
        letterSpacing: 2,
        inherit: true,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500);

    return Scaffold(

      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/sec.jpg"),
          fit: BoxFit.fitHeight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.25,
            ),
            Text(
              "Update wardrobe",
              style: boldTextStyle,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              "Here you can choose things for any wardrobe, even change your style",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: normalTextStyle,
            ),
            SizedBox(
              height: height * 0.45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width*0.8,
                    height: height*0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/secondScreen');
                      },
                      child: Text(
                        "NEXT",
                        style:TextStyle(
                            color: MyColors.myWhite,
                            fontSize: height * 0.025,
                            letterSpacing: 2,
                            inherit: true,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.myBlack,
                        elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                          shadowColor:MyColors.myOrange
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
