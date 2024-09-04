import 'package:flutter/material.dart';
import 'package:metafit/contants/const_colors.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;

  CustomCard({
    required this.text,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: isSelected
          ? Colors.blueAccent.withOpacity(0.5)
          : Colors.grey.withOpacity(0.5),
      // shadowColor: ConstColors.textColor, // Add elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5), // Adjust the circular border radius
      ),
      // color: isSelected ? Colors.blueAccent : Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? Colors.blueAccent.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: ConstColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                height: 37,
                width: 37,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
