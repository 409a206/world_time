import 'dart:js_util';
import 'dart:ui_web';

import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location =''; //location name for the ui
  String time =''; //the time in that location
  String flag = ''; //url to an asset flag icon
  String urlString = ' '; //location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.urlString});

  Future<void> getTime() async {
    try{
      var url = Uri.parse('https://worldtimeapi.org/api/timezone/$urlString');
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));

      //set the time property
      time = now.toString();
    }
    catch(e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}
