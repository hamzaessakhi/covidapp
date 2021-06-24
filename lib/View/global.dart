import 'dart:convert';

import 'package:covid_19/Model/countryModel.dart';
import 'package:covid_19/Model/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../colors.dart';

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

List<Countrymodel> list = [];
var jsonData;
bool isLoading = true;

class _GlobalState extends State<Global> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var url = 'https://corona.lmao.ninja/v2/countries';
    var response = await http.get(url);
    setState(() {
      jsonData = jsonDecode(response.body);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          child: isLoading
              ? Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: kBackgroundColor,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Loading info ...',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                kPrimaryColor.withOpacity(.005),
                                Color(0xFFE2E2E2)
                              ],
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      jsonData[index]['country'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    Image.network(
                                      jsonData[index]['countryInfo']['flag'],
                                      height: 80,
                                      width: 100,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Confirmed Cases: ' +
                                            jsonData[index]['cases'].toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        'New Cases: +' +
                                            jsonData[index]['todayCases']
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        'Total Recovered: ' +
                                            jsonData[index]['recovered']
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        'Total Deaths: ' +
                                            jsonData[index]['deaths']
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(.03),
    elevation: 0,
    title: Text('                                Global',
        style: TextStyle(color: Colors.black)),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () {
          showSearch(context: context, delegate: Search(jsonData));
        },
      ),
    ],
  );
}
