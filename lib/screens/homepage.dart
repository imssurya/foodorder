import 'package:flutter/material.dart';
import 'package:foodorder/helpers/changescreen.dart';
import 'package:foodorder/providers/authprovider.dart';
import 'package:foodorder/screens/cartpage.dart';
import 'package:foodorder/widgets/bottomnavicon.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/widgets/customtext.dart';
import 'package:foodorder/widgets/featureproducts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.1,
        backgroundColor: black,
        title: CustomText(
          text: "FoodApp",
          color: white,
          weight: FontWeight.bold,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  // color: black,
                ),
                onPressed: () {
                  changeScreen(context, CartPage());
                },
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  //alignment: Alignment.topRight,
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  // color: black,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  //alignment: Alignment.topRight,
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: CustomText(
            //           text: 'What would you like to eat?',
            //           size: 22.0,
            //         )

            //         // Text(
            //         //   'What would you like to eat?',
            //         //   style: TextStyle(fontSize: 22.0),
            //         // ),
            //         ),
            //     Stack(
            //       children: <Widget>[
            //         IconButton(
            //           icon: Icon(Icons.notifications_none),
            //           onPressed: () {},
            //         ),
            //         Positioned(
            //           top: 10,
            //           right: 12,
            //           child: Container(
            //             //alignment: Alignment.topRight,
            //             height: 10.0,
            //             width: 10.0,
            //             decoration: BoxDecoration(
            //                 color: red,
            //                 borderRadius: BorderRadius.circular(20)),
            //           ),
            //         )
            //       ],
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 5.0,
            // ),
            Container(
              color: black,
              //decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(10), color: black),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(30),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: grey, offset: Offset(1, 1), blurRadius: 4.0),
                    // ],
                  ),
                  child: ListTile(
                    leading: Icon(Icons.search, color: red),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Find a Food or Restaurents  ',
                          border: InputBorder.none),
                    ),
                    trailing: Icon(Icons.filter_list, color: red),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 130.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: red,
                                offset: Offset(2, 3),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FlutterLogo(
                              size: 75,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomText(
                          text: 'Salad',
                          size: 16,
                          color: black,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            FeaturedProducts(),
            Padding(padding: EdgeInsets.all(4)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      //color: red,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FlutterLogo(
                          size: 400,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite,
                          color: red,
                        ),
                      ),
                      Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavIcon(
              image: 'null',
              name: 'Home',
              onTap: () {},
            ),
            BottomNavIcon(
              image: 'null',
              name: 'Near by',
            ),
            BottomNavIcon(
              image: 'null',
              name: 'Cart',
              onTap: () {
                changeScreen(context, CartPage());
              },
            ),
            BottomNavIcon(
              image: 'null',
              name: 'Account',
              onTap: () {},
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: black),
              accountName: CustomText(
                  text: authProvider.userModel.name,
                  color: white,
                  weight: FontWeight.bold),
              accountEmail:
                  CustomText(text: authProvider.userModel.email, color: white),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: 'Home'),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartPage());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: 'Cart Items'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.person),
              title: CustomText(text: 'Account'),
            ),
          ],
        ),
      ),
    );
  }
}
