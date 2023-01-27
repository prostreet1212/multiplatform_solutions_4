import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/second_page.dart';
import 'package:multiplatform_solutions_4/widgets/menu_bottom_sheet.dart';
import 'package:multiplatform_solutions_4/widgets/user_list_view.dart';

import 'Model/person.dart';
import 'utils/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Person>> getPersons() async {
    List<Person> personList = [];
    String result = await fetchFileFromAssets('assets/persons.json');
    List<dynamic> persons = jsonDecode(result);
    personList = persons.map((e) => Person.fromJson(e)).toList();
    return personList;
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: width>1000?AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          /*shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
            ),
          ),*/
        ):PreferredSize(child: Container(), preferredSize: Size.fromHeight(0)),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: getPersons(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case ConnectionState.done:
                  {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Ошибка загрузки данных'),
                      );
                    } else {
                      List<Person> persons = snapshot.data!;
                      //return UserListView(persons: persons);
                      return SecondPage(persons: persons,);
                    }
                  }
                default:
                  {
                    return Container();
                  }
              }
            },
          ),
        ));
  }
}
