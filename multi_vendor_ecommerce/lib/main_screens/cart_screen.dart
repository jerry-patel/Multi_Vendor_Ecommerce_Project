import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/widgets/app_bar_widgets.dart';
import 'package:multi_vendor_ecommerce/widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: widget.back,
            title: const AppBarTitle(title: 'Cart'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),


          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Cart Is Empty !',
                  style: TextStyle(
                    fontSize: 30
                  ),
                ),
                const SizedBox(height: 50),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.60,
                    onPressed: () {
                      Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : Navigator.pushReplacementNamed(
                              context, '/customer_home_screen');
                    },
                    child: const Text(
                    "continue shopping",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),

          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                 children: const [
                   Text(
                     'Total: \$ ',
                     style: TextStyle(fontSize: 18),
                   ),

                   Text(
                     '00.00',
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                         color: Colors.red),
                   ),
                 ],
               ),

                YellowButton(
                  label: 'CHECK OUT',
                  width: 0.45,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



