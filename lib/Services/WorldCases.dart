import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldCases{

  String location;
  String casesActive;
  String casesTotal;
  String deathToday;
  String deathTotal;
  String casesToday;
  String flag;//
  String url;
  String recoveredTotal;

WorldCases({this.location, this.flag, this.url});
    Future <void> getData() async {

      try{
        Response response = await get('https://disease.sh/v2/$url');
        Map data = jsonDecode(response.body);

        int todayCases = data['todayCases'];
        int totalCases = data['cases'];
        int todayDeaths = data['todayDeaths'];
        int totalDeaths = data['deaths'];
        int activeCases = data['active'];
        int recovered = data['recovered'];


        casesActive = NumberFormat().format(activeCases);
        casesTotal = NumberFormat().format(totalCases);
        deathToday = NumberFormat().format(todayDeaths);
        casesToday = NumberFormat().format(todayCases);
        deathTotal = NumberFormat().format(totalDeaths);
        recoveredTotal = NumberFormat().format(recovered);
        print (deathToday);


      }
      catch (e){
         print('caught error $e');
         casesActive = 'Data Error';
         casesTotal = 'Data Error';
         deathToday ='Data Error';
         casesToday = 'Data Error';
         deathTotal = 'Data Error';
         recoveredTotal = 'Data Error';
      }



  }



}
