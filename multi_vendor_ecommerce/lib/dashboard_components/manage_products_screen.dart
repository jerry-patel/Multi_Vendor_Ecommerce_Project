import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/widgets/app_bar_widgets.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarTitle(title: 'Manage Products'),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
