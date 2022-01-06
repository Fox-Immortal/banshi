import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:panshi/presentation_layer/screens/controller_screens/cart_screen.dart';
import 'package:panshi/presentation_layer/screens/controller_screens/controller_screen.dart';
import 'package:panshi/presentation_layer/screens/get_started_page/first_screen.dart';
import 'package:panshi/presentation_layer/screens/get_started_page/log_option_screen1.dart';
import 'package:panshi/presentation_layer/screens/get_started_page/sec_screen.dart';
import 'package:panshi/presentation_layer/screens/get_started_page/third_screen.dart';
import 'package:panshi/presentation_layer/screens/log_option/create_account_screen/create_account_screen.dart';
import 'package:panshi/presentation_layer/screens/log_option/log_in_screen/log_in_screen.dart';
import 'package:panshi/presentation_layer/screens/log_option/log_option_screen/log_option_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // static final Handler _logOptionHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
  //     const LogOptionScreen());

  // static final Handler _homeHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
  //     const HomeScreen()); // this one is for one paramter passing...

  // static final Handler _loginHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
  //     const LogInScreen()); // this one is for one paramter passing...

  // static final Handler _createHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
  //     const CreateAccount()); // this one is for one paramter passing...


  static final Handler _logOptionHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const LoginOptionScreen();
  }); // this one is for one paramter passing...

  static final Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
      const LoginScreen());

  static final Handler _createAccountHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
      const CreateAccountScreen());

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
      const ControllerScreen());

  static final Handler _firstHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
      const FirstScreen());

  static final Handler _secondHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
      const SecondScreen());

  static final Handler _thirdHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
      const ThirdScreen());


  static final Handler _logOption1Handler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return const LogOptionScreen1();
      }); // this one is for one paramter passing...

  static final Handler _cartHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return const CartScreen();
      }); // this one is for one paramter passing...

  // var usersHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //   return HomeScreen();
  // });

  // lets create for two parameters tooo...
  // static Handler _mainHandler2 = Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         LandingPage(page: params['name'][0],extra: params['extra'][0],));

  // ok its all set now .....
  // now lets have a handler for passing parameter tooo....
  static void setupRouter() {
    router.define(
      '/log',
      handler: _logOptionHandler,
    );
    router.define(
      '/createAccount',
      handler: _createAccountHandler,
    );
    router.define(
      '/login',
      handler: _loginHandler,
    );
    router.define(
      '/controller',
      handler: _homeHandler,
    );
    router.define(
      '/',
      handler: _firstHandler,
    );
    router.define(
      '/secondScreen',
      handler: _secondHandler,
    );
    router.define(
      '/thirdScreen',
      handler: _thirdHandler,
    );
    router.define(
      '/log1',
      handler: _logOption1Handler,
    );
    router.define(
      '/cart',
      handler: _cartHandler,
    );
    // router.define(
    //   '/home',
    //   handler: _homeHandler,
    //   transitionType: TransitionType.fadeIn,
    // );
    // router.define(
    //   '/login',
    //   handler: _loginHandler,
    //   transitionType: TransitionType.fadeIn,
    // );
    // router.define(
    //   '/createAccount',
    //   handler: _createHandler,
    //   transitionType: TransitionType.fadeIn,
    // );
    // router.define(
    //   '/allContact',
    //   handler: _allContactHandler,
    //   transitionType: TransitionType.fadeIn,
    // );
    // router.define(
    //   '/page/:name',
    //   handler: _pageHandler,
    //   transitionType: TransitionType.fadeIn,
    // );
  }
}
