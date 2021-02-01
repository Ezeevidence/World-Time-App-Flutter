import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldtimeclass.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [


    WorldTime(url: 'CET', location: 'CET', flag: 'world.png'),
    WorldTime(url: 'EST', location: 'EST', flag: 'world.png'),
    WorldTime(url: 'Etc/GMT', location: 'GMT', flag: 'world.png'),
    WorldTime(url: 'Etc/UTC', location: 'UTC', flag: 'world.png'),
    WorldTime(url: 'WET', location: 'WET', flag: 'world.png'),


    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'indonesia.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'Africa/Johannesburg', location: '"Johannesburg"', flag: 'south africa.png'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'tunisia.png'),


    WorldTime(url: 'Atlantic/Cape_Verde', location: 'Cape_Verde', flag: 'capeverde.png'),
    WorldTime(url: 'Atlantic/Madeira', location: 'Madeira', flag: 'portugal.png'),


    WorldTime(url: 'Asia/Baghdad', location: 'Baghdad', flag: 'iraq.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'thailand.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala_Lumpur', flag: 'malaysia.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(url: 'Asia/Tehran', location: 'Tehran', flag: 'iran.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'qatar.png'),

    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos_Aires', flag: 'argentina.png'),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flag: 'barbados.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/Detroit', location: 'Detroit', flag: 'usa.png'),
    WorldTime(url: 'America/Denver', location: 'Denver', flag: 'usa.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los_Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flag: 'barbados.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'Sao_Paulo', flag: 'brazil.png'),
    WorldTime(url: 'America/Bogota', location: 'Bogota', flag: 'columbia.png'),
    WorldTime(url: 'America/Vancouver', location: 'Vancouver', flag: 'canada.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'canada.png'),


    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'australia.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Australia/Perth', location: 'Perth', flag: 'australia.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),




    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki', flag: 'finland.png'),

    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'turkey.png'),

    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon', flag: 'portugal.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'norway.png'),

    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
    WorldTime(url: 'Europe/Stockholm', location: 'Stockholm', flag: 'sweden.png'),





  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}