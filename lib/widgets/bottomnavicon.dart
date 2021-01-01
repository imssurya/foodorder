import 'package:flutter/material.dart';
import 'package:foodorder/widgets/customtext.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;

  const BottomNavIcon({Key key, this.image, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          FlutterLogo(),
          SizedBox(height: 2.0),
          CustomText(text: name)
        ],
      ),
    );
  }
}

// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Wrap(
//                 children: <Widget>[
//                   FlutterLogo(),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   CustomText(text: 'Near by')
//                 ],
//               ),
//             ),
