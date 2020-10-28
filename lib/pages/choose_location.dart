import 'dart:async';

import 'package:covid19/Services/WorldCases.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class Debouncer{
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});
  run(VoidCallback action){
    if(null !=_timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _ChooseLocationState extends State<ChooseLocation> {

List<WorldCases> locations =[
  WorldCases(url: 'all', location:'Global', flag:'globe'),
  WorldCases(url: 'countries/Afghanistan', location: 'Afghanistan', flag: 'af'),
  WorldCases(url: 'countries/Albania', location: 'Albania', flag: 'al'),
  WorldCases(url: 'countries/Algeria', location: 'Algeria', flag: 'dz'),
  WorldCases(url:'countries/Argentina', location:'Argentina', flag: 'ar'),
  WorldCases(url: 'countries/Armenia', location: 'Armenia', flag: 'am'),
  WorldCases(url: 'countries/Australia', location: 'Australia', flag: 'au'),
  WorldCases(url: 'countries/Austria', location: 'Austria', flag: 'at'),
  WorldCases(url: 'countries/Azerbaijan', location: 'Azerbaijan', flag: 'az'),
  WorldCases(url: 'countries/Bahrain', location: 'Bahrain', flag: 'bh'),
  WorldCases(url: 'countries/Bangladesh', location: 'Bangladesh', flag: 'bd'),
  WorldCases(url: 'countries/Belgium', location: 'Belgium', flag: 'be'),
  WorldCases(url: 'countries/Bhutan', location: 'Bhutan', flag: 'bt'),
  WorldCases(url: 'countries/Bolivia', location: 'Bolivia', flag: 'bo'),
  WorldCases(url: 'countries/Bosnia', location: 'Bosnia', flag: 'ba'),
  WorldCases(url:'countries/Brazil', location: 'Brazil', flag: 'br'),
  WorldCases(url: 'countries/Bulgaria', location: 'Bulgaria', flag: 'bg'),
  WorldCases(url: 'countries/Cambodia', location: 'Cambodia', flag: 'kh'),
  WorldCases(url: 'countries/Cameroon', location: 'Cameroon', flag: 'cm'),
  WorldCases(url: 'countries/Canada', location: 'Canada', flag: 'ca'),
  WorldCases(url: 'countries/Chile', location: 'Chile', flag: 'cl'),
  WorldCases(url:'countries/China', location:'China', flag: 'cn'),
  WorldCases(url: 'countries/Colombia', location: 'Colombia', flag: 'co'),
  WorldCases(url: 'countries/costa%20rica', location: 'Costa Rica', flag: 'cr'),
  WorldCases(url: 'countries/Croatia', location: 'Croatia', flag: 'hr'),
  WorldCases(url: 'countries/Cuba', location: 'Cuba', flag: 'cu'),
  WorldCases(url: 'countries/Cyprus', location: 'Cyprus', flag: 'cy'),
  WorldCases(url: 'countries/Denmark', location: 'Denmark', flag: 'dk'),
  WorldCases(url: 'countries/Dominican%20republic', location: 'Dominican Republic', flag: 'do'),
  WorldCases(url: 'countries/Ecuador', location: 'Ecuador', flag: 'ec'),
  WorldCases(url: 'countries/Egypt', location: 'Egypt', flag: 'eg'),
  WorldCases(url: 'countries/Estonia', location: 'Estonia', flag: 'ee'),
  WorldCases(url: 'countries/Ethiopia', location: 'Ethiopia', flag: 'et'),
  WorldCases(url: 'countries/Fiji', location: 'Fiji', flag: 'fj'),
  WorldCases(url: 'countries/Finland', location: 'Finland', flag: 'fi'),
  WorldCases(url:'countries/France', location:'France', flag: 'fr'),
  WorldCases(url: 'countries/Georgia', location: 'Georgia', flag: 'ge'),
  WorldCases(url: 'countries/Germany', location: 'Germany', flag: 'de'),
  WorldCases(url: 'countries/Ghana', location: 'Ghana', flag: 'gh'),
  WorldCases(url: 'countries/Greece', location: 'Greece', flag: 'gr'),
  WorldCases(url: 'countries/Greenland', location: 'Greenland', flag: 'gl'),
  WorldCases(url: 'countries/Hungary', location: 'Hungary', flag: 'hu'),
  WorldCases(url: 'countries/Iceland', location: 'Iceland', flag: 'is'),
  WorldCases(url:'countries/India', location:'India', flag: 'in'),
  WorldCases(url: 'countries/Indonesia', location: 'Indonesia', flag: 'id'),
  WorldCases(url: 'countries/Iran', location: 'Iran', flag: 'ir'),
  WorldCases(url: 'countries/Iraq', location: 'Iraq', flag: 'iq'),
  WorldCases(url: 'countries/Ireland', location: 'Ireland', flag: 'ie'),
  WorldCases(url: 'countries/Israel', location: 'Israel', flag: 'il'),
  WorldCases(url: 'countries/Italy', location: 'Italy', flag: 'it'),
  WorldCases(url: 'countries/Jamaica', location: 'Jamaica', flag: 'jm'),
  WorldCases(url: 'countries/Japan', location: 'Japan', flag: 'jp'),
  WorldCases(url: 'countries/Kazakhstan', location: 'Kazakhstan', flag: 'kz'),
  WorldCases(url: 'countries/Kenya', location: 'Kenya', flag: 'ke'),
  WorldCases(url: 'countries/Kuwait', location: 'Kuwait', flag: 'kw'),
  WorldCases(url: 'countries/Kyrgyzstan', location: 'Kyrgyzstan', flag: 'kg'),
  WorldCases(url: 'countries/Latvia', location: 'Latvia', flag: 'lv'),
  WorldCases(url: 'countries/Lebanon', location: 'Lebanon', flag: 'lb'),
  WorldCases(url: 'countries/Liberia', location: 'Liberia', flag: 'lr'),
  WorldCases(url: 'countries/Liechtenstein', location: 'Liechtenstein', flag: 'li'),
  WorldCases(url: 'countries/Lithuania', location: 'Lithuania', flag: 'lt'),
  WorldCases(url: 'countries/Luxembourg', location: 'Luxembourg', flag: 'lu'),
  WorldCases(url: 'countries/Macao', location: 'Macao', flag: 'mo'),
  WorldCases(url: 'countries/Macedonia', location: 'Macedonia', flag: 'mk'),
  WorldCases(url: 'countries/Madagascar', location: 'Madagascar', flag: 'mg'),
  WorldCases(url: 'countries/Malawi', location: 'Malawi', flag: 'mw'),
  WorldCases(url: 'countries/Malaysia', location: 'Malaysia', flag: 'my'),
  WorldCases(url: 'countries/Maldives', location: 'Maldives', flag: 'mv'),
  WorldCases(url: 'countries/Mali', location: 'Mali', flag: 'ml'),
  WorldCases(url: 'countries/Malta', location: 'Malta', flag: 'mt'),
  WorldCases(url: 'countries/Mauritania', location: 'Mauritania', flag: 'mr'),
  WorldCases(url: 'countries/Mauritius', location: 'Mauritius', flag: 'mu'),
  WorldCases(url: 'countries/Mexico', location: 'Mexico', flag: 'mx'),
  WorldCases(url: 'countries/Moldova', location: 'Moldova', flag: 'md'),
  WorldCases(url: 'countries/Monaco', location: 'Monaco', flag: 'mc'),
  WorldCases(url: 'countries/Mongolia', location: 'Mongolia', flag: 'mn'),
  WorldCases(url: 'countries/Montenegro', location: 'Montenegro', flag: 'me'),
  WorldCases(url: 'countries/Morocco', location: 'Morocco', flag: 'ma'),
  WorldCases(url: 'countries/Mozambique', location: 'Mozambique', flag: 'mz'),
  WorldCases(url: 'countries/Myanmar', location: 'Myanmar', flag: 'mm'),
  WorldCases(url: 'countries/Namibia', location: 'Namibia', flag: 'na'),
  WorldCases(url: 'countries/Nepal', location: 'Nepal', flag: 'np'),
  WorldCases(url: 'countries/Netherlands', location: 'Netherlands', flag: 'nl'),
  WorldCases(url: 'countries/new%20zealand', location: 'New Zealand', flag: 'nz'),
  WorldCases(url: 'countries/Nicaragua', location: 'Nicaragua', flag: 'ni'),
  WorldCases(url: 'countries/Niger', location: 'Niger', flag: 'ne'),
  WorldCases(url: 'countries/Nigeria', location: 'Nigeria', flag: 'ng'),
  WorldCases(url: 'countries/Norway', location: 'Norway', flag: 'no'),
  WorldCases(url: 'countries/Oman', location: 'Oman', flag: 'om'),
  WorldCases(url: 'countries/Pakistan', location: 'Pakistan', flag: 'pk'),
  WorldCases(url: 'countries/Palestine', location: 'Palestine', flag: 'ps'),
  WorldCases(url: 'countries/Panama', location: 'Panama', flag: 'pa'),
  WorldCases(url: 'countries/Paraguay', location: 'Paraguay', flag: 'py'),
  WorldCases(url: 'countries/Peru', location: 'Peru', flag: 'pe'),
  WorldCases(url: 'countries/Philippines', location: 'Philippines', flag: 'ph'),
  WorldCases(url: 'countries/Poland', location: 'Poland', flag: 'pl'),
  WorldCases(url: 'countries/Portugal', location: 'Portugal', flag: 'pt'),
  WorldCases(url: 'countries/Qatar', location: 'Qatar', flag: 'qa'),
  WorldCases(url: 'countries/Romania', location: 'Romania', flag: 'ro'),
  WorldCases(url:'countries/Russia', location:'Russia', flag: 'ru'),
  WorldCases(url: 'countries/Rwanda', location: 'Rwanda', flag: 'rw'),
  WorldCases(url: 'countries/south%20korea', location: 'South Korea', flag: 'kr'),
  WorldCases(url: 'countries/saudi%20arabia', location: 'Saudi Arabia', flag: 'sa'),
  WorldCases(url: 'countries/Senegal', location: 'Senegal', flag: 'sn'),
  WorldCases(url: 'countries/Serbia', location: 'Serbia', flag: 'rs'),
  WorldCases(url: 'countries/Seychelles', location: 'Seychelles', flag: 'sc'),
  WorldCases(url: 'countries/Sierra%20leone', location: 'Sierra Leone', flag: 'sl'),
  WorldCases(url:'countries/Singapore', location:'Singapore', flag: 'sg'),
  WorldCases(url: 'countries/Slovakia', location: 'Slovakia', flag: 'sk'),
  WorldCases(url: 'countries/Slovenia', location: 'Slovenia', flag: 'si'),
  WorldCases(url:'countries/Somalia', location:'Somalia', flag: 'so'),
  WorldCases(url:'countries/south%20africa', location:'South Africa', flag: 'za'),
  WorldCases(url:'countries/south%20sudan', location:'South Sudan', flag: 'ss'),
  WorldCases(url:'countries/Spain', location:'Spain', flag: 'es'),
  WorldCases(url:'countries/sri%20lanka', location:'Sri Lanka', flag: 'lk'),
  WorldCases(url:'countries/Sudan', location:'Sudan', flag: 'sd'),
  WorldCases(url:'countries/Sweden', location:'Sweden', flag: 'se'),
  WorldCases(url:'countries/Switzerland', location:'Switzerland', flag: 'ch'),
  WorldCases(url:'countries/syria', location:'Syria', flag: 'sy'),
  WorldCases(url:'countries/Taiwan', location:'Taiwan', flag: 'tw'),
  WorldCases(url:'countries/Tajikistan', location:'Tajikistan', flag: 'tj'),
  WorldCases(url:'countries/Tanzania', location:'Tanzania', flag: 'tz'),
  WorldCases(url:'countries/Thailand', location:'Thailand', flag: 'th'),
  WorldCases(url:'countries/Tunisia', location:'Tunisia', flag: 'tn'),
  WorldCases(url:'countries/Turkey', location:'Turkey', flag: 'tr'),
  WorldCases(url:'countries/UAE', location:'UAE', flag: 'ae'),
  WorldCases(url:'countries/uganda', location:'Uganda', flag: 'ug'),
  WorldCases(url:'countries/United%20kingdom', location:'United Kingdom', flag: 'gb'),
  WorldCases(url:'countries/Ukraine', location:'Ukraine', flag: 'ua'),
  WorldCases(url:'countries/Uruguay', location:'Uruguay', flag: 'uy'),
  WorldCases(url:'countries/USA', location:'United States', flag: 'us'),
  WorldCases(url:'countries/Uzbekistan', location:'Uzbekistan', flag: 'uz'),
  WorldCases(url:'countries/Venezuela', location:'Venezuela', flag: 've'),
  WorldCases(url:'countries/Vietnam', location:'Vietnam', flag: 'vn'),
  WorldCases(url:'countries/western%20sahara', location:'Western Sahara', flag: 'eh'),
  WorldCases(url:'countries/Yemen', location:'Yemen', flag: 'ye'),
  WorldCases(url:'countries/Zambia', location:'Zambia', flag: 'zm'),
  WorldCases(url:'countries/Zimbabwe', location:'Zimbabwe', flag: 'zw'),



];

List<WorldCases> filteredLocations =[
  WorldCases(url: 'all', location:'Global', flag:'globe'),
  WorldCases(url: 'countries/Afghanistan', location: 'Afghanistan', flag: 'af'),
  WorldCases(url: 'countries/Albania', location: 'Albania', flag: 'al'),
  WorldCases(url: 'countries/Algeria', location: 'Algeria', flag: 'dz'),
  WorldCases(url:'countries/Argentina', location:'Argentina', flag: 'ar'),
  WorldCases(url: 'countries/Armenia', location: 'Armenia', flag: 'am'),
  WorldCases(url: 'countries/Australia', location: 'Australia', flag: 'au'),
  WorldCases(url: 'countries/Austria', location: 'Austria', flag: 'at'),
  WorldCases(url: 'countries/Azerbaijan', location: 'Azerbaijan', flag: 'az'),
  WorldCases(url: 'countries/Bahrain', location: 'Bahrain', flag: 'bh'),
  WorldCases(url: 'countries/Bangladesh', location: 'Bangladesh', flag: 'bd'),
  WorldCases(url: 'countries/Belgium', location: 'Belgium', flag: 'be'),
  WorldCases(url: 'countries/Bhutan', location: 'Bhutan', flag: 'bt'),
  WorldCases(url: 'countries/Bolivia', location: 'Bolivia', flag: 'bo'),
  WorldCases(url: 'countries/Bosnia', location: 'Bosnia', flag: 'ba'),
  WorldCases(url:'countries/Brazil', location: 'Brazil', flag: 'br'),
  WorldCases(url: 'countries/Bulgaria', location: 'Bulgaria', flag: 'bg'),
  WorldCases(url: 'countries/Cambodia', location: 'Cambodia', flag: 'kh'),
  WorldCases(url: 'countries/Cameroon', location: 'Cameroon', flag: 'cm'),
  WorldCases(url: 'countries/Canada', location: 'Canada', flag: 'ca'),
  WorldCases(url: 'countries/Chile', location: 'Chile', flag: 'cl'),
  WorldCases(url:'countries/China', location:'China', flag: 'cn'),
  WorldCases(url: 'countries/Colombia', location: 'Colombia', flag: 'co'),
  WorldCases(url: 'countries/costa%20rica', location: 'Costa Rica', flag: 'cr'),
  WorldCases(url: 'countries/Croatia', location: 'Croatia', flag: 'hr'),
  WorldCases(url: 'countries/Cuba', location: 'Cuba', flag: 'cu'),
  WorldCases(url: 'countries/Cyprus', location: 'Cyprus', flag: 'cy'),
  WorldCases(url: 'countries/Denmark', location: 'Denmark', flag: 'dk'),
  WorldCases(url: 'countries/Dominican%20republic', location: 'Dominican Republic', flag: 'do'),
  WorldCases(url: 'countries/Ecuador', location: 'Ecuador', flag: 'ec'),
  WorldCases(url: 'countries/Egypt', location: 'Egypt', flag: 'eg'),
  WorldCases(url: 'countries/Estonia', location: 'Estonia', flag: 'ee'),
  WorldCases(url: 'countries/Ethiopia', location: 'Ethiopia', flag: 'et'),
  WorldCases(url: 'countries/Fiji', location: 'Fiji', flag: 'fj'),
  WorldCases(url: 'countries/Finland', location: 'Finland', flag: 'fi'),
  WorldCases(url:'countries/France', location:'France', flag: 'fr'),
  WorldCases(url: 'countries/Georgia', location: 'Georgia', flag: 'ge'),
  WorldCases(url: 'countries/Germany', location: 'Germany', flag: 'de'),
  WorldCases(url: 'countries/Ghana', location: 'Ghana', flag: 'gh'),
  WorldCases(url: 'countries/Greece', location: 'Greece', flag: 'gr'),
  WorldCases(url: 'countries/Greenland', location: 'Greenland', flag: 'gl'),
  WorldCases(url: 'countries/Hungary', location: 'Hungary', flag: 'hu'),
  WorldCases(url: 'countries/Iceland', location: 'Iceland', flag: 'is'),
  WorldCases(url:'countries/India', location:'India', flag: 'in'),
  WorldCases(url: 'countries/Indonesia', location: 'Indonesia', flag: 'id'),
  WorldCases(url: 'countries/Iran', location: 'Iran', flag: 'ir'),
  WorldCases(url: 'countries/Iraq', location: 'Iraq', flag: 'iq'),
  WorldCases(url: 'countries/Ireland', location: 'Ireland', flag: 'ie'),
  WorldCases(url: 'countries/Israel', location: 'Israel', flag: 'il'),
  WorldCases(url: 'countries/Italy', location: 'Italy', flag: 'it'),
  WorldCases(url: 'countries/Jamaica', location: 'Jamaica', flag: 'jm'),
  WorldCases(url: 'countries/Japan', location: 'Japan', flag: 'jp'),
  WorldCases(url: 'countries/Kazakhstan', location: 'Kazakhstan', flag: 'kz'),
  WorldCases(url: 'countries/Kenya', location: 'Kenya', flag: 'ke'),
  WorldCases(url: 'countries/Kuwait', location: 'Kuwait', flag: 'kw'),
  WorldCases(url: 'countries/Kyrgyzstan', location: 'Kyrgyzstan', flag: 'kg'),
  WorldCases(url: 'countries/Latvia', location: 'Latvia', flag: 'lv'),
  WorldCases(url: 'countries/Lebanon', location: 'Lebanon', flag: 'lb'),
  WorldCases(url: 'countries/Liberia', location: 'Liberia', flag: 'lr'),
  WorldCases(url: 'countries/Liechtenstein', location: 'Liechtenstein', flag: 'li'),
  WorldCases(url: 'countries/Lithuania', location: 'Lithuania', flag: 'lt'),
  WorldCases(url: 'countries/Luxembourg', location: 'Luxembourg', flag: 'lu'),
  WorldCases(url: 'countries/Macao', location: 'Macao', flag: 'mo'),
  WorldCases(url: 'countries/Macedonia', location: 'Macedonia', flag: 'mk'),
  WorldCases(url: 'countries/Madagascar', location: 'Madagascar', flag: 'mg'),
  WorldCases(url: 'countries/Malawi', location: 'Malawi', flag: 'mw'),
  WorldCases(url: 'countries/Malaysia', location: 'Malaysia', flag: 'my'),
  WorldCases(url: 'countries/Maldives', location: 'Maldives', flag: 'mv'),
  WorldCases(url: 'countries/Mali', location: 'Mali', flag: 'ml'),
  WorldCases(url: 'countries/Malta', location: 'Malta', flag: 'mt'),
  WorldCases(url: 'countries/Mauritania', location: 'Mauritania', flag: 'mr'),
  WorldCases(url: 'countries/Mauritius', location: 'Mauritius', flag: 'mu'),
  WorldCases(url: 'countries/Mexico', location: 'Mexico', flag: 'mx'),
  WorldCases(url: 'countries/Moldova', location: 'Moldova', flag: 'md'),
  WorldCases(url: 'countries/Monaco', location: 'Monaco', flag: 'mc'),
  WorldCases(url: 'countries/Mongolia', location: 'Mongolia', flag: 'mn'),
  WorldCases(url: 'countries/Montenegro', location: 'Montenegro', flag: 'me'),
  WorldCases(url: 'countries/Morocco', location: 'Morocco', flag: 'ma'),
  WorldCases(url: 'countries/Mozambique', location: 'Mozambique', flag: 'mz'),
  WorldCases(url: 'countries/Myanmar', location: 'Myanmar', flag: 'mm'),
  WorldCases(url: 'countries/Namibia', location: 'Namibia', flag: 'na'),
  WorldCases(url: 'countries/Nepal', location: 'Nepal', flag: 'np'),
  WorldCases(url: 'countries/Netherlands', location: 'Netherlands', flag: 'nl'),
  WorldCases(url: 'countries/new%20zealand', location: 'New Zealand', flag: 'nz'),
  WorldCases(url: 'countries/Nicaragua', location: 'Nicaragua', flag: 'ni'),
  WorldCases(url: 'countries/Niger', location: 'Niger', flag: 'ne'),
  WorldCases(url: 'countries/Nigeria', location: 'Nigeria', flag: 'ng'),
  WorldCases(url: 'countries/Norway', location: 'Norway', flag: 'no'),
  WorldCases(url: 'countries/Oman', location: 'Oman', flag: 'om'),
  WorldCases(url: 'countries/Pakistan', location: 'Pakistan', flag: 'pk'),
  WorldCases(url: 'countries/Palestine', location: 'Palestine', flag: 'ps'),
  WorldCases(url: 'countries/Panama', location: 'Panama', flag: 'pa'),
  WorldCases(url: 'countries/Paraguay', location: 'Paraguay', flag: 'py'),
  WorldCases(url: 'countries/Peru', location: 'Peru', flag: 'pe'),
  WorldCases(url: 'countries/Philippines', location: 'Philippines', flag: 'ph'),
  WorldCases(url: 'countries/Poland', location: 'Poland', flag: 'pl'),
  WorldCases(url: 'countries/Portugal', location: 'Portugal', flag: 'pt'),
  WorldCases(url: 'countries/Qatar', location: 'Qatar', flag: 'qa'),
  WorldCases(url: 'countries/Romania', location: 'Romania', flag: 'ro'),
  WorldCases(url:'countries/Russia', location:'Russia', flag: 'ru'),
  WorldCases(url: 'countries/Rwanda', location: 'Rwanda', flag: 'rw'),
  WorldCases(url: 'countries/south%20korea', location: 'South Korea', flag: 'kr'),
  WorldCases(url: 'countries/saudi%20arabia', location: 'Saudi Arabia', flag: 'sa'),
  WorldCases(url: 'countries/Senegal', location: 'Senegal', flag: 'sn'),
  WorldCases(url: 'countries/Serbia', location: 'Serbia', flag: 'rs'),
  WorldCases(url: 'countries/Seychelles', location: 'Seychelles', flag: 'sc'),
  WorldCases(url: 'countries/Sierra%20leone', location: 'Sierra Leone', flag: 'sl'),
  WorldCases(url:'countries/Singapore', location:'Singapore', flag: 'sg'),
  WorldCases(url: 'countries/Slovakia', location: 'Slovakia', flag: 'sk'),
  WorldCases(url: 'countries/Slovenia', location: 'Slovenia', flag: 'si'),
  WorldCases(url:'countries/Somalia', location:'Somalia', flag: 'so'),
  WorldCases(url:'countries/south%20africa', location:'South Africa', flag: 'za'),
  WorldCases(url:'countries/south%20sudan', location:'South Sudan', flag: 'ss'),
  WorldCases(url:'countries/Spain', location:'Spain', flag: 'es'),
  WorldCases(url:'countries/sri%20lanka', location:'Sri Lanka', flag: 'lk'),
  WorldCases(url:'countries/Sudan', location:'Sudan', flag: 'sd'),
  WorldCases(url:'countries/Sweden', location:'Sweden', flag: 'se'),
  WorldCases(url:'countries/Switzerland', location:'Switzerland', flag: 'ch'),
  WorldCases(url:'countries/syria', location:'Syria', flag: 'sy'),
  WorldCases(url:'countries/Taiwan', location:'Taiwan', flag: 'tw'),
  WorldCases(url:'countries/Tajikistan', location:'Tajikistan', flag: 'tj'),
  WorldCases(url:'countries/Tanzania', location:'Tanzania', flag: 'tz'),
  WorldCases(url:'countries/Thailand', location:'Thailand', flag: 'th'),
  WorldCases(url:'countries/Tunisia', location:'Tunisia', flag: 'tn'),
  WorldCases(url:'countries/Turkey', location:'Turkey', flag: 'tr'),
  WorldCases(url:'countries/UAE', location:'UAE', flag: 'ae'),
  WorldCases(url:'countries/uganda', location:'Uganda', flag: 'ug'),
  WorldCases(url:'countries/UK', location:'United Kingdom', flag: 'gb'),
  WorldCases(url:'countries/Ukraine', location:'Ukraine', flag: 'ua'),
  WorldCases(url:'countries/Uruguay', location:'Uruguay', flag: 'uy'),
  WorldCases(url:'countries/USA', location:'United States', flag: 'us'),
  WorldCases(url:'countries/Uzbekistan', location:'Uzbekistan', flag: 'uz'),
  WorldCases(url:'countries/Venezuela', location:'Venezuela', flag: 've'),
  WorldCases(url:'countries/Vietnam', location:'Vietnam', flag: 'vn'),
  WorldCases(url:'countries/western%20sahara', location:'Western Sahara', flag: 'eh'),
  WorldCases(url:'countries/Yemen', location:'Yemen', flag: 'ye'),
  WorldCases(url:'countries/Zambia', location:'Zambia', flag: 'zm'),
  WorldCases(url:'countries/Zimbabwe', location:'Zimbabwe', flag: 'zw'),


];

void updateData(index) async{
  WorldCases instance = filteredLocations[index];
  await instance.getData();
  Navigator.pop(context, {
    'location': instance.location,
    'casesActive': instance.casesActive,
    'casesTotal': instance.casesTotal,
    'deathToday': instance.deathToday,
    'deathTotal': instance.deathTotal,
    'casesToday': instance.casesToday,
    'recoveredTotal': instance.recoveredTotal,
    'flag': instance.flag
  });
}


  @override
  Widget build(BuildContext context) {
    bool _isEnableTile = true;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: <Widget>[
          TextField(
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.white
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
              contentPadding: EdgeInsets.all(10.0),
              hintText: 'Enter Country',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              )
            ),
            onChanged: (string){
              setState(() {
                filteredLocations = locations
                    .where((u)=>(u.location.toLowerCase()
                .contains(string.toLowerCase()))
                ).toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index){
                return Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      child: ListTile(
                        onTap:(){
                          if (_isEnableTile){
                            _isEnableTile = false;
                            updateData(index);
                          }
                          else{
                            print('meh');
                          }

                        },
                        title: Text(filteredLocations[index].location,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/${filteredLocations[index].flag}.png'),
                          backgroundColor: Colors.grey[900],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
