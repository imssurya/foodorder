import 'package:flutter/material.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/models/product.dart';
import 'package:foodorder/widgets/customtext.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Products product = Products(
      name: 'Cereals',
      price: 5.99,
      rating: 4.2,
      vendor: 'GoodFoos',
      wishlist: false,
      image: 'flutter logo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: white,
        elevation: 0.0,
        centerTitle: true,
        title: CustomText(
          text: 'Shopping cart',
          size: 18,
          weight: FontWeight.bold,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_bag,
                    size: 35,
                    color: red,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: grey, offset: Offset(2, 1), blurRadius: 3)
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: CustomText(
                        text: '2',
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 120,
                //  width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: red,
                      offset: Offset(3, 5),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlutterLogo(
                      size: 80,
                    ),
                    Padding(padding: EdgeInsets.only(right: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: product.name + '\n',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '\$' + product.price.toString() + '\n',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 240),
                        IconButton(icon: Icon(Icons.delete), onPressed: null)
                      ],
                    ),
                    //    IconButton(icon: Icon(Icons.delete), onPressed: null)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
