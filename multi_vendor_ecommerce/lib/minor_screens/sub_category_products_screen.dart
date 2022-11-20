import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/widgets/app_bar_widgets.dart';

class SubCategoryProductsScreen extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;

  const SubCategoryProductsScreen(
      {Key? key, required this.subCategoryName, required this.mainCategoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: subCategoryName),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}


