import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/cart_provider.dart';
import 'package:panshi/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshi/flurorouter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const PanshiApp());
}


class PanshiApp extends StatefulWidget {
  const PanshiApp({Key? key,}) : super(key: key);

  @override
  _PanshiAppState createState() => _PanshiAppState();
}

class _PanshiAppState extends State<PanshiApp> {
  @override
  void initState() {
    Flurorouter.setupRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartItemsProvider>(
          create: (_)=> CartItemsProvider(cartItems: {},total: 0.0,length: 0),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_)=> UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
      ),
    );
  }
}
