import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/dashboard_components/edit_business_screen.dart';
import 'package:multi_vendor_ecommerce/dashboard_components/manage_products_screen.dart';
import 'package:multi_vendor_ecommerce/dashboard_components/my_store_screen.dart';
import 'package:multi_vendor_ecommerce/dashboard_components/statics_screen.dart';
import 'package:multi_vendor_ecommerce/dashboard_components/supplier_balance_screen.dart';
import 'package:multi_vendor_ecommerce/dashboard_components/supplier_orders_screen.dart';
import 'package:multi_vendor_ecommerce/widgets/app_bar_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> label = [
    'My Store',
    'Orders',
    'Edit Profile',
    'Manage Products',
    'Balance',
    'Statics'
  ];
  List<IconData> icons = [
    Icons.store_rounded,
    Icons.shop_2_outlined,
    Icons.edit,
    Icons.settings_applications_sharp,
    Icons.attach_money_rounded,
    Icons.show_chart_rounded,
  ];

  List<Widget> pages = [
    const MyStoreScreen(),
    const SupplierOrdersScreen(),
    const EditBusinessScreen(),
    const ManageProductsScreen(),
    const BalanceScreen(),
    const StaticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarTitle(title: 'dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                '/welcome_screen',
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
        itemCount: label.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> pages[i]));
              },
              child: Card(
                color: Colors.blueGrey.withOpacity(0.7),
                shadowColor: Colors.purpleAccent.shade200,
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[i],
                      color: Colors.yellowAccent,
                      size: 50,
                    ),
                    Text(
                      label[i].toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Acme',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
