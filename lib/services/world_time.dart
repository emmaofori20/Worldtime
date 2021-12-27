import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String? location;// location
  String? time;// for time
  String? flag;// for flag
  String? link; // fot the url
  bool? isDaytime;

  //Constructor
  WorldTime({required this.location, required this.flag, required this.link});

  Future<void> getTime() async{

    try {
      var url = Uri.https('www.worldtimeapi.org','/api/timezone/$link');
      print(url);
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      print('default $data');

      //getting data properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //Creating a datetime object
      DateTime now = DateTime.parse(datetime);
      print('the now time $datetime ');
      print('the offset data is $offset');
      now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 15 ?true: false;
      time = DateFormat.jm().format(now);
      print(now);
      print('set time $time');
    }
    catch( e ){
      //print(e);
      time= 'cannot get data';
    }
    

  }


}