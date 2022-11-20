import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final double width;
  const YellowButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(35),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}