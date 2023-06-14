import 'package:sky_vision/model/city.dart';

class Forecast{

  static final City instance = City();

  late City _city;
  late String _date;
  late double _maxTemp;
  late double _minTemp;
  late double _rainProbability;
  late String _description;

   City getCity(){
    return _city;
   }

   void setCity(City city){
    _city = city;
   }

   double getMaxTemp(){
    return _maxTemp;
   }

   void setMaxTemp(double maxTemp){
    _maxTemp = maxTemp;
   }

   double getMinTemp(){
    return _minTemp;
   }

   void setMinTemp(double minTemp){
    _minTemp = minTemp;
   }

   double getRainProbability(){
    return _rainProbability;
   }

   void setRainProbability(double rainProbability){
    _rainProbability = rainProbability;
   }
   
   String getDescription(){
    return _description;
   }

   void setDescription(String description){
    _description = description;
   }

   String getDate(){
    return _date;
   }

   void setDate(String date){
    _date = date;
   }

}