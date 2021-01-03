import 'package:flutter/material.dart';
import 'package:foodorder/helpers/changescreen.dart';
import 'package:foodorder/providers/productprovider.dart';
import 'package:foodorder/providers/userprovider.dart';
import 'package:foodorder/providers/categoryprovider.dart';
import 'package:foodorder/providers/restaurantprovider.dart';
import 'package:foodorder/screens/cartpage.dart';
import 'package:foodorder/screens/loginpage.dart';
import 'package:foodorder/screens/categorypage.dart';
import 'package:foodorder/screens/orderpage.dart';
import 'package:foodorder/widgets/bottomnavicon.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/widgets/customtext.dart';
import 'package:foodorder/widgets/featureproducts.dart';
import 'package:provider/provider.dart';
import 'package:foodorder/widgets/categorypart.dart';
import 'package:foodorder/widgets/restaurantpart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: black,
        title: CustomText(
          text: "FoodApp",
          color: white,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartPage());
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: red,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        // app.changeLoading();
                        // if(app.search == SearchBy.PRODUCTS){
                        //   await productProvider.search(productName: pattern);
                        //   changeScreen(context, ProductSearchScreen());
                        // }else{
                        //   await restaurantProvider.search(name: pattern);
                        //   changeScreen(context, RestaurantsSearchScreen());
                        // }
                        //  app.changeLoading();
                      },
                      decoration: InputDecoration(
                        hintText: "Find food and restaurant",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[]),
            Divider(),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await productProvider.loadProductsByCategory();
                      changeScreen(
                          context,
                          CategoryPage(
                              categoryModel:
                                  categoryProvider.categories[index]));
                    },
                    child: CategoryPart(
                      category: categoryProvider.categories[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Featured",
                    size: 20,
                    color: grey,
                  ),
                ],
              ),
            ),
            FeaturedProducts(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Popular restaurants",
                    size: 20,
                    color: grey,
                  ),
                ],
              ),
            ),
            Column(
              children: restaurantProvider.restaurants
                  .map(
                    (item) => GestureDetector(
                      onTap: () async {
                        changeScreen(
                          context,
                          RestaurantPart(
                            restaurant: item,
                          ),
                        );
                      },
                      child: RestaurantPart(
                        restaurant: item,
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 70,
      //   color: white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       BottomNavIcon(
      //         image: 'null',
      //         name: 'Home',
      //         onTap: () {},
      //       ),
      //       BottomNavIcon(
      //         image: 'null',
      //         name: 'Near by',
      //       ),
      //       BottomNavIcon(
      //         image: 'null',
      //         name: 'Cart',
      //         onTap: () {
      //           changeScreen(context, CartPage());
      //         },
      //       ),
      //       BottomNavIcon(
      //         image: 'null',
      //         name: 'Account',
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: black),
              accountName: CustomText(
                text: userProvider.userModel?.name ?? "username lading...",
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: userProvider.userModel?.email ?? "email loading...",
                color: white,
              ),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, HomePage());
              },
              leading: Icon(Icons.home),
              title: CustomText(text: "Home"),
            ),
            ListTile(
              onTap: () async {
                //  await userProvider.getOrders();
                changeScreen(context, OrderPage());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartPage());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {
                userProvider.signOut();
                changeScreenReplacement(context, LoginPage());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
