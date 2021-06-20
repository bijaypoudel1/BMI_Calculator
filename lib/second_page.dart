import 'package:bim_calculator/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SecondPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String message;
  SecondPage({required this.bmi,required this.result,required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0C23),
        appBar: AppBar(
          title: Text('BIM CALCULATOR'),
          backgroundColor: Color(0xFF0A0C23),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Your result',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1E1F33),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      Text(result,
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),
                      Text(bmi,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          )),
                      Text(
                       message,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BottomButton(text: 'Re-Calculate', onTap: (){
            Navigator.pop(context);

            })
          ]),
        ));
  }
}
