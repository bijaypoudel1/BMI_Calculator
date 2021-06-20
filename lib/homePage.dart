import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_child.dart';
import 'my_container.dart';
import 'second_page.dart';
import 'bmi_brain.dart';

const activeColor = Colors.pink;
const inactiveColor = Color(0xFF111328);

enum GenderType { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenderType? gender;
  double sliderValue = 150;
  int height = 180;
  int age = 20;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIM Calculator'),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(children: [
          Row(children: [
            MyContainer(
              myHeight: MediaQuery.of(context).size.height * 0.3,
              myWidth: MediaQuery.of(context).size.width * 0.43,
              myFun: () {
                setState(() {
                  gender = GenderType.male;
                });
              },
              activeColorNumber: gender == GenderType.male ? activeColor : inactiveColor,
              cardChild: MyChild(
                gender: 'male',
                myIcon: Icon(
                  FontAwesomeIcons.mars,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            MyContainer(
                myWidth: MediaQuery.of(context).size.width * 0.43,
                myHeight: MediaQuery.of(context).size.height * 0.3,
                myFun: () {
                  setState(() {
                    gender = GenderType.female;

                  });
                },
                activeColorNumber:
                    gender == GenderType.female ? activeColor : inactiveColor,

                cardChild: MyChild(
                  gender: 'female',
                  myIcon: Icon(
                    FontAwesomeIcons.venus,
                    size: 50,
                    color: Colors.white,
                  ),
                )),
          ]),
          MyContainer(
            // myHeight:MediaQuery.of(context).size.height*0.3,
            myWidth: MediaQuery.of(context).size.width * 1,
            activeColorNumber: inactiveColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xF5A3A3A7)),
                  ),
                  // SizedBox(height:10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          sliderValue.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(width:10),
                        Text('cm')
                      ]),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        inactiveTrackColor: Colors.grey,
                        overlayColor: Color(0x4fe71e63)),
                    child: Slider(
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      label: sliderValue.round().toString(),
                      divisions: 100,
                      min: 120,
                      max: 220,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
              children: [
            MyContainer(
              // myHeight: MediaQuery.of(context).size.height * 0.3,
              myWidth: MediaQuery.of(context).size.width * 0.44,
              activeColorNumber: inactiveColor,
              cardChild: Padding(
                padding: const EdgeInsets.only(top:25,bottom: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xF5A3A3A7),
                        ),
                      ),
                      Text(age.toString(),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CounterButton(
                            myIcon: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('plus clicked');

                              setState(() {
                                if (age < 100) {
                                  age++;
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          CounterButton(
                            myIcon: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('minus clicked');
                              setState(() {
                                if (age >= 1) {
                                  age--;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            MyContainer(

              myWidth: MediaQuery.of(context).size.width * 0.44,
              // myHeight: MediaQuery.of(context).size.height * 0.3,
              activeColorNumber: inactiveColor,
              cardChild: Padding(
                padding: const EdgeInsets.only(top:25,bottom:25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Wiegth',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xF5A3A3A7))),
                      Text(weight.toString(),
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFf))),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        CounterButton(
                            myIcon:
                                Icon(FontAwesomeIcons.plus, color: Colors.white),
                            onClick: () {
                              setState(() {
                                weight++;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CounterButton(
                            myIcon:
                                Icon(FontAwesomeIcons.minus, color: Colors.white),
                            onClick: () {
                              setState(() {
                                weight--;
                              });
                            })
                      ])
                    ]),
              ),
            ),
          ]),
// SizedBox(height:60),
          BottomButton(text: 'Calculate',
              onTap: (){
          BmiBrain obj = BmiBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(
            builder:(context)=>SecondPage(
            bmi: obj.bmi(),
              message: obj.message(),
              result: obj.result(),
            )
            ),
            );
    }
          ),
        ],

    ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  CounterButton({required this.myIcon, required this.onClick});
  final Widget myIcon;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      child: myIcon,
      shape: CircleBorder(),
      fillColor: Colors.pink,
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
    );
  }
}

class BottomButton extends StatelessWidget {
 final String text;
 final Function() onTap;
 BottomButton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.1,
          alignment: Alignment.center,
          // margin: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
             text,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

