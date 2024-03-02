import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urlString: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlString: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlString: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlString: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlString: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlString: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlString: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlString: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a Location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

