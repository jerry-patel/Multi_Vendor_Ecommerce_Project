import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/categories/accessories_category.dart';
import 'package:multi_vendor_ecommerce/categories/bags_category.dart';
import 'package:multi_vendor_ecommerce/categories/beauty_category.dart';
import 'package:multi_vendor_ecommerce/categories/electronics_category.dart';
import 'package:multi_vendor_ecommerce/categories/home_and_garden_category.dart';
import 'package:multi_vendor_ecommerce/categories/kids_category.dart';
import 'package:multi_vendor_ecommerce/categories/men_category.dart';
import 'package:multi_vendor_ecommerce/categories/shoes_category.dart';
import 'package:multi_vendor_ecommerce/categories/women_category.dart';
import 'package:multi_vendor_ecommerce/widgets/fake_search.dart';

List<ItemsData> items = [
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'beauty'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'bags'),
];


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final PageController _pageController = PageController();


  @override
  void initState() {
    // All Items isSelected set false
    for(var element in items) {
      element.isSelected = false;
    }
    // Make selected Items highlighted
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categoryView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.80,
      width: size.width * 0.20,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(i,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceInOut);
              },
              child: Container(
                height: 100,
                color: items[i].isSelected == true ? Colors.white : Colors.grey.shade300,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      items[i].label,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget categoryView(Size size) {
    return Container(
      height: size.height * 0.80,
      width: size.width * 0.80,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (val) {
          // All Items isSelected set false
          for(var element in items) {
            element.isSelected = false;
          }
          // Make selected Items highlighted
          setState(() {
            items[val].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          ShoesCategory(),
          HomeGardenCategory(),
          BeautyCategory(),
          KidsCategory(),
          BagsCategory(),
        ],
      ),
    );
  }
}


class ItemsData {
  String label;
  bool isSelected;

  ItemsData({required this.label, this.isSelected = false});
}