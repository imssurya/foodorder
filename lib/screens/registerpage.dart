import 'package:flutter/material.dart';
import 'package:foodorder/helpers/changescreen.dart';
import 'package:foodorder/helpers/stylecolor.dart';
import 'package:foodorder/providers/userprovider.dart';
import 'package:foodorder/screens/homepage.dart';
import 'package:foodorder/screens/loginpage.dart';
import 'package:foodorder/widgets/customtext.dart';
import 'package:foodorder/widgets/loading.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: 300,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.userName,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.account_box,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: grey),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.password,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signUp()) {
                          _key.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Registration Failed'),
                            ),
                          );
                          return;
                        }
                        authProvider.cleanControllers();
                        changeScreen(context, HomePage());
                      },
                      child: Container(
                        //color: red,
                        decoration: BoxDecoration(
                            color: red,
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                text: 'Register',
                                color: white,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, LoginPage());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Login here',
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
