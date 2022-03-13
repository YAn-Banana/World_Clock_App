import 'package:flutter/material.dart';
import 'package:world_clock_app/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Hong Kong', flag: 'hong_kong.png', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Dubai', flag: 'dubai.png', url: 'Asia/Dubai'),
    WorldTime(
        location: 'Philippines', flag: 'philippine.png', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Nairobi', flag: 'nairobi.png', url: 'Africa/Nairobi'),
    WorldTime(
        location: 'New York', flag: 'newyork.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'seoul.png', url: 'Asia/Seoul'),
    WorldTime(
        location: 'Maldives', flag: 'maldives.png', url: 'Indian/Maldives'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Choose a Location'),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            child: Card(
                child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${locations[index].flag}'),
              ),
            )),
          );
        },
      ),
    );
  }
}
