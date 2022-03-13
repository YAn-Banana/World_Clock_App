import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location for the UI
  String time = ""; // time for that location
  String flag; // url to an asset flag icon
  String url; // location url for the api endpoint
  bool isDayTime = true; //if day time or night time

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request from the http
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create DataTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      // set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
    }
  }
}
