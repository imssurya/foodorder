import 'package:flutter/material.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/models/category.dart';
import 'package:foodorder/widgets/customtext.dart';

//List<CategoryModel> categoryModel = [];

class CategoryPart extends StatelessWidget {
  final CategoryModel category;

  const CategoryPart({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: 140,
            height: 160,
            // decoration: BoxDecoration(
            //   color: white,
            //   //borderRadius: BorderRadius.circular(30.0),
            //   boxShadow: [
            //     BoxShadow(
            //         color: Colors.red, offset: Offset(4, 6), blurRadius: 20),
            //   ],
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FlutterLogo(),
            ),
          ),
          Container(
            width: 140,
            height: 160,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              // gradient: LinearGradient(
              //   begin: Alignment.bottomCenter,
              //   end: Alignment.topCenter,
              //   colors: [
              //     Colors.black.withOpacity(0.6),
              //     Colors.black.withOpacity(0.6),
              //     Colors.black.withOpacity(0.6),
              //     Colors.black.withOpacity(0.4),
              //     Colors.black.withOpacity(0.1),
              //     Colors.black.withOpacity(0.05),
              //     Colors.black.withOpacity(0.025),
              //   ],
              // ),
              boxShadow: [
                BoxShadow(
                    color: Colors.red, offset: Offset(1, 0), blurRadius: 2),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: CustomText(text: category.name, size: 16, color: black),
            ),
          ),
        ],
      ),
    );
  }
}
