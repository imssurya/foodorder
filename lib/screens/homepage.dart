import 'package:flutter/material.dart';
import 'package:foodorder/widgets/commons.dart';
import 'package:foodorder/widgets/customtext.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                      text: 'What would you like to eat?',
                      size: 22.0,
                    )

                    // Text(
                    //   'What would you like to eat?',
                    //   style: TextStyle(fontSize: 22.0),
                    // ),
                    ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications_none),
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
                            color: red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(color: grey, offset: Offset(1, 1), blurRadius: 4.0),
                ],
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
            )
          ],
        ),
      ),
    );
  }
}
