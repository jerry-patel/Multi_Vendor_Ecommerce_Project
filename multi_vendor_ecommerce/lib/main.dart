import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/auth/customer_signup.dart';
import 'package:multi_vendor_ecommerce/main_screens/customer_home_screen.dart';

import 'main_screens/supplier_home_screen.dart';
import 'main_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_home_screen': (context) => const CustomerHomeScreen(),
        '/supplier_home_screen': (context) => const SupplierHomeScreen(),
        '/customer_signup_screen': (context) => const CustomerRegisterScreen(),
      },
    );
  }
}
