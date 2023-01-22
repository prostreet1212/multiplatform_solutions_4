import 'dart:convert';

import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
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
        ),
        body: FutureBuilder(
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
                    return ListView.builder(
                        itemCount: persons.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(),
                              ],
                            ),
                          );
                        });
                  }
                }
              default:
                {
                  return Container();
                }
            }
          },
        ));
  }
}
