import 'package:flutter/material.dart';
import 'package:covid19/Services/WorldCases.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldCases() async {
    WorldCases instance = WorldCases(location: 'Global', flag: 'globe', url:'all');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'casesActive': instance.casesActive,
      'casesTotal': instance.casesTotal,
      'deathToday': instance.deathToday,
      'deathTotal': instance.deathTotal,
      'casesToday': instance.casesToday,
      'flag': instance.flag,
      'recoveredTotal': instance.recoveredTotal,

    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldCases();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
