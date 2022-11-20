import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/minor_screens/sub_category_products_screen.dart';

// Category Screen - Main Category Name
class CategoryHeaderLabel extends StatelessWidget {
  final String headerLabel;

  const CategoryHeaderLabel({Key? key, required this.headerLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Text(
        headerLabel,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

// Subcategory List Tile
class SubCategoryTile extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;
  final String assetImage;
  final String subcategoryLabel;

  const SubCategoryTile(
      {Key? key,
      required this.mainCategoryName,
      required this.subCategoryName,
      required this.assetImage,
      required this.subcategoryLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryProductsScreen(
              mainCategoryName: mainCategoryName,
              subCategoryName: subCategoryName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(image: AssetImage(assetImage)),
          ),
          Text(subcategoryLabel,
          style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// Main Category Slider bar
class SliderBar extends StatelessWidget {
  final String mainCategoryName;

  const SliderBar({Key? key, required this.mainCategoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainCategoryName == 'bags'
                    ? const Text('')
                    : const Text(" << ", style: style),
                Text(
                  mainCategoryName.toUpperCase(),
                  style: style,
                ),
                mainCategoryName == 'men'
                    ? const Text('')
                    : const Text(" >> ", style: style),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const style = TextStyle(
  color: Colors.brown,
  fontSize: 16,
  fontWeight: FontWeight.w600,
  letterSpacing: 10,
);
