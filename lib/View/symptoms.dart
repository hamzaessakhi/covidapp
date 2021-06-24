import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class Symptoms extends StatelessWidget {

  List<String> items = [
    'HEADACHE',
    'DRY COUGH',
    'SHORT BREATH',
    'HIGHT FEVER',
  ];
  List<String> photos =[
    'assets/icons/head.png',
    'assets/icons/couch.png',
    'assets/icons/breath.png',
    'assets/icons/heat.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
    body:Container(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
          itemCount: items.length,
          itemBuilder: (context,index){
        return Container(
          decoration: BoxDecoration(
              color: Color(0xffE9F4F8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )
          ),
          width: 160.0,
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Image(
                    image: AssetImage(photos[index]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      )
                  ),
                  child: Center(
                    child: Text(items[index],style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 12.0,
                    ),),
                  ),
                ),
              ),
            ],
          ),
        );
      })
    ));
  }
}
AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(.03),
    elevation: 0,
    title: Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tSymptoms"),
  );
}