import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/constant/my_colors.dart';
import 'package:panshi/data_layer/web_services/email_services/email_services.dart';
import 'package:panshi/data_layer/web_services/google_services/google_services.dart';
import 'package:panshi/presentation_layer/screens/controller_screens/cart_screen.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/category_screen/category_screen.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/home_screen/home_screen.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/profile_screen/profile_screen.dart';
import 'package:panshi/presentation_layer/screens/controller_sub_screens/wishlist_screen/wishlist_screen.dart';
import 'package:panshi/presentation_layer/screens/log_option/log_option_screen/log_option_screen.dart';
import 'package:provider/provider.dart';

  class ControllerScreen extends StatefulWidget {
  const ControllerScreen({Key? key}) : super(key: key);

  @override
  _ControllerScreenState createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  int value = 0;
  int currentScreen = 0;
  int lastIndex = -1;
  final Color selectedColor = MyColors.myOrange;
  final List<Widget> _children = [
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen()
  ];
  void onItemTapped(int index) {
    setState(() {
      value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: MyColors.myWhite,
        drawer:Drawer(
          child: ListView(children: <Widget>[
            SizedBox(
              height: height * 0.1,
              child: Center(
                child: Container(
                  width: width,
                  height: height * 0.09,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/panshiLogo.png"),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            _drawerOption("Log out", width, height, 2, 0, Icons.logout),
          ]),
        ),
        appBar: AppBar(
          backgroundColor: MyColors.myBlack,
          elevation: 0,
          centerTitle: true,
          title: Container(
            width: width * 0.3,
            height: height * 0.06,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/panshiLogo2.png"),
            )),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              splashColor: const Color(0xFFff0000),
              splashRadius: height * 0.03,
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                FontAwesomeIcons.bars,
                color: MyColors.myWhite,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const CartScreen()));
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                )),

          ],
        ),

        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
            backgroundColor: MyColors.myBlack,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: value,
            unselectedItemColor: MyColors.myWhite,
            selectedItemColor: selectedColor,
            onTap: onItemTapped,
          ),
        ),
        body: _children[value]);
  }
  Widget _drawerOption(String optionName, double width, double height,
      int cIndex, lIndex, IconData icon) {
    String? loginType =
        Provider.of<UserProvider>(context, listen: false).loginType;
    return InkWell(
      onTap:Provider.of<UserProvider>(context,listen:false).loginType=="Google"?()async {
        await GoogleService().signOutGoogle(context).then((value) async {
          removeProviderData(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
              const LoginOptionScreen()));
        });
      }:()async{
        await EmailSignServices().userLogOut(context).then((value) async {
          removeProviderData(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
              const LoginOptionScreen()));
        });
      },

      child: Container(
        margin: EdgeInsets.only(bottom: height * 0.02),
        height: height * 0.1,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.04),
              height: height * 0.09,
              width: width * 0.02,
              decoration: BoxDecoration(
                  color: currentScreen == cIndex
                      ? MyColors.myOrange
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(height * 0.02),
                      topRight: Radius.circular(height * 0.02))),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Icon(icon,
                  color: currentScreen == cIndex
                      ? MyColors.myOrange
                      : Colors.black87,
                  size: height * 0.035),
            ),
            Text(
              optionName,
              style: TextStyle(
                  fontSize: height * 0.03, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }

  removeProviderData(context) {
    setState(() {
      Provider.of<UserProvider>(context, listen: false).email = "";
      Provider.of<UserProvider>(context, listen: false).isVerify = false;
      Provider.of<UserProvider>(context, listen: false).uid = "";
      Provider.of<UserProvider>(context, listen: false).name = "";
      Provider.of<UserProvider>(context, listen: false).number = "";
      Provider.of<UserProvider>(context, listen: false).loginType = "";
    });
  }

}
