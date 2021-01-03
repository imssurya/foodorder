import 'package:flutter/material.dart';
import 'package:foodorder/helpers/screencontroller.dart';
import 'package:foodorder/models/product.dart';
import 'package:foodorder/providers/productprovider.dart';
import 'package:foodorder/providers/userprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:foodorder/providers/categoryprovider.dart';
import 'package:foodorder/providers/restaurantprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ScreenController(),
      ),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Food App',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: ScreenController(),
//     );
//   }
// }
