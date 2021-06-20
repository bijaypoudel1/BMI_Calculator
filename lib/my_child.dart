import 'package:flutter/material.dart';
class MyChild extends StatelessWidget {

  MyChild({ this.gender,  required this.myIcon, this.mySlider});
  final String? gender;
  final Widget myIcon;
  final Widget? mySlider;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(FontAwesomeIcons.mars,size: 50,color: Colors.white,),
        myIcon,
        SizedBox(height: 10),
        Text('$gender',
            style: TextStyle(fontSize: 20, color: Color(0xFFB3AEAE))),
        // Slider(value: value, onChanged: onChanged),
      ],
    );
  }
}
