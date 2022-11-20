import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/widgets/app_bar_widgets.dart';

class CustomerOrdersScreen extends StatelessWidget {
  const CustomerOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarTitle(title: 'Customer Orders'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
