import 'package:flutter/material.dart';
import 'package:foodorder/helpers/changescreen.dart';
import 'package:foodorder/models/product.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/screens/detailpage.dart';
import 'package:foodorder/widgets/customtext.dart';

List<Products> productsList = [
  Products(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: 'GoodFoos',
      wishlist: false,
      image: 'flutter logo'),
  Products(
      name: 'Taccos',
      price: 5.99,
      rating: 4.2,
      vendor: 'GoodFoos',
      wishlist: true,
      image: 'flutter logo'),
];

class FeaturedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
            child: GestureDetector(
              onTap: () {
                changeScreen(
                  context,
                  DetailPage(
                    products: productsList[index],
                  ),
                );
              },
              child: Container(
                height: 220.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: red,
                      offset: Offset(15, 5),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    FlutterLogo(
                      size: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                            text: '${productsList[index].name}',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: grey,
                                    offset: Offset(1, 1),
                                    blurRadius: 4)
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: productsList[index].wishlist
                                  ? Icon(
                                      Icons.favorite,
                                      color: red,
                                      size: 18,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: red,
                                      size: 18,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: CustomText(
                                text: productsList[index].rating.toString(),
                                color: grey,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star_border,
                              color: red,
                              size: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: '\$12.99',
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
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
