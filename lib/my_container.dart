import 'package:flutter/material.dart';
// const activeColorNumber = Color(0xFF535050);

class MyContainer extends StatelessWidget {
  MyContainer({this.activeColorNumber, this.cardChild, this.myFun,  this.myHeight,  this.myWidth});
final double? myHeight;
final double? myWidth;
  final Widget? cardChild;
  final Color? activeColorNumber;
  final   VoidCallback? myFun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myFun,
      child: Container(
      height: myHeight,
        width: myWidth,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: activeColorNumber),
        child: cardChild,
      ),
    );
  }
}