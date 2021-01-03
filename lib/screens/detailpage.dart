import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:foodorder/models/product.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/widgets/customtext.dart';

class DetailPage extends StatefulWidget {
  final ProductModel products;

  const DetailPage({Key key, @required this.products}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 350.0,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  FlutterLogo(),
                                  Positioned(
                                    right: 5,
                                    bottom: 2,
                                    top: 10.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: grey,
                                            offset: Offset(2, 1),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 4.0,
                                          right: 4.0,
                                        ),
                                        child: CustomText(
                                          text: '2',
                                          color: red,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_bag),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Carousel(
                    images: [
                      FlutterLogo(),
                      FlutterLogo(),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                  ),
                  Positioned(
                    right: 14,
                    bottom: 14,
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: grey,
                                offset: Offset(2, 3),
                                blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite,
                          color: red,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
            CustomText(
              text: widget.products.name,
              size: 24,
              weight: FontWeight.bold,
            ),
            CustomText(
              text: '\$' + widget.products.price.toString(),
              size: 18,
              color: red,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 28,
                      ),
                      onPressed: () {}),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(28, 12, 24, 12),
                      child: CustomText(
                        text: 'Add To Bag',
                        color: white,
                        size: 24,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 28,
                        color: red,
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
