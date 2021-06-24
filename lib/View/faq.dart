import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../Service/questionAnswers.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 5.0),
        child:  ListView.builder(
            shrinkWrap: true,
            itemCount: Queries.questionAnswers.length,
            itemBuilder: (context, index) {
              return Theme(
                data: ThemeData(unselectedWidgetColor: kPrimaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ExpansionTile(
                      leading: Icon(Icons.question_answer),
                      trailing: Icon(Icons.add),
                      backgroundColor: Colors.blue.shade50,
                      title: Text(
                        Queries.questionAnswers[index]['question'],
                        style: TextStyle(fontSize: 18.0,color: Colors.blueGrey),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          child: Text(
                            Queries.questionAnswers[index]['answer'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor.withOpacity(.03),
    elevation: 0,
    title: Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tFAQ"),

  );
}
