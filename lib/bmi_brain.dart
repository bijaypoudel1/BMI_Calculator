import 'dart:math';
class BmiBrain{
  int height;
  int weight;
  BmiBrain({required this.height,required this.weight});

   double _bmi=0;
  String bmi(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result(){
    if(_bmi<18.5)
      return "Under Weight";
    else if(_bmi>18.5&&_bmi<24.9)
      return "Normal";
    else
      return 'Over Weight';
  }

  String message(){
    if(_bmi<18.5)
      return "Eat meals with fibrous carbohydrates and healthful fats".toUpperCase();
    else if(_bmi>18.5&&_bmi<24.9)
      return "you are normal. keep it up".toUpperCase();
    else
      return 'Engage in regular physical activity and exercise'.toUpperCase();
  }
}