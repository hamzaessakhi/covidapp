import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/Service/maroc_stats.dart';
import 'package:covid_19/colors.dart';
import 'package:covid_19/Model/card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  Brain appData =Brain();
  bool Sprig = true ;
  int totalCase = 0;
  int totalDeath =0 ;
  int totalRecovered =0 ;
  int newcases=0;
  int active=0;
  int totalTests=0;


  void uploadUi() async{
    dynamic data = await appData.getData() ;
    setState(() {
      if (data != null) {
        Sprig =false ;
        totalCase = data["cases"];
        totalRecovered = data["recovered"];
        totalDeath = data["deaths"];
        newcases = data["todayCases"];
        active = data["active"];
        totalTests = data["totalTests"];

      }
    });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadUi()  ;
  }
  @override
  Widget build(BuildContext context) {
    var noww = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(noww);
    return Scaffold(
      appBar: buildAppBar(),

//wrap singlechildscrollview for correct displaying in small density devices
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t "+formattedDate,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.bold,color: kPrimaryColor),
          ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  InfoCard(
                    title: "Confirmed Cases",
                    iconColor: Color(0xFFFF8C00),
                    effectedNum: totalCase,
                    press: () {},
                  ),
                  InfoCard(
                    title: "Total Deaths",
                    iconColor: Color(0xFFFF2D55),
                    effectedNum: totalDeath,
                    press: () {},
                  ),
                  InfoCard(
                    title: "Total Recovered",
                    iconColor: Color(0xFF50E3C2),
                    effectedNum: totalRecovered,
                    press: () {},
                  ),
                  InfoCard(
                    title: "New Cases",
                    iconColor: Color(0xFF5856D6),
                    effectedNum:  newcases,
                    press: () {

                    },
                  ),InfoCard(
                    title: "Active Cases",
                    iconColor: Color(0xFFFFAF10),
                    effectedNum:  active,
                    press: () {

                    },
                  ),InfoCard(
                    title: "Total Tests",
                    iconColor: Color(0xFF57D380),
                    effectedNum:  totalTests,
                    press: () {

                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}




AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(.03),
    elevation: 0,
    title: Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tMorocco"),

  );
}



