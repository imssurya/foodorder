import 'package:flutter/material.dart';
import 'package:foodorder/providers/authprovider.dart';
import 'package:foodorder/screens/homepage.dart';
import 'package:foodorder/screens/loginpage.dart';
import 'package:foodorder/widgets/loading.dart';
import 'package:provider/provider.dart';

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return LoginPage();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Loading();
      case Status.Authenticated:
        return HomePage();
      default:
        return LoginPage();
    }
  }
}
