import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(link: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(link: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(link: 'Africa/Accra', location: 'Ghana', flag: 'ghana.png'),
    WorldTime(link: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(link: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(link: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(link: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];


  //update time
  void updateTime (index) async{

    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });

    print('${instance.location} + ${instance.time}' );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);

                  print('the index $index');
                },
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('${locations[index].flag.toString()}'),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
