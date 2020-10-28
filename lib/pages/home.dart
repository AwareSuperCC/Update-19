import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map totalData={};

  @override
  Widget build(BuildContext context) {

    String recovery;

    if(totalData['recoveredTotal']=='0'){
      recovery= 'N/A';
    }
    else{
      recovery = totalData['recoveredTotal'];
    }

    totalData = totalData.isNotEmpty ? totalData : ModalRoute.of(context).settings.arguments;
    print(totalData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Update'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/204358.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
            child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10,0,0),
                child: FlatButton.icon(
                  color: Colors.grey[500],
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      totalData = {
                        'location': result['location'],
                        'casesActive': result['casesActive'],
                        'casesTotal': result['casesTotal'],
                        'deathToday': result['deathToday'],
                        'deathTotal': result['deathTotal'],
                        'casesToday': result['casesToday'],
                        'recoveredTotal': result['recoveredTotal'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon:Icon(Icons.edit_location,
                  color: Colors.grey[900],
                  ),
                  label: Text('Select Country',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[900]
                  ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(totalData['location'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.grey[300],
              ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0,20, 0, 40),),
              Row(
                children: <Widget>[
                  Text('Today\'s Cases  : ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  ),
                  Text( totalData['casesToday'],
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Text('Today\'s Deaths : ',
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),),
                  Text( totalData['deathToday'],
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Text('Active Cases     : ',
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),),
                  Text( totalData['casesActive'],
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Text('Total Cases       : ',
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),),
                  Text( totalData['casesTotal'],
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Text('Total Deaths      : ',
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),),
                  Text( totalData['deathTotal'],
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.white,
                    ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: <Widget>[
                  Text('Recoveries         : ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                  Text( recovery,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),)
                ],
              ),
            SizedBox(height: 47),
              Expanded(
                child:Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,5,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.copyright,
                          color: Colors.white,
                        ),
                        Text('Aalman Mohammed',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                )

              )

            ],
        ),
          ),),
      ),
    );
  }
}
