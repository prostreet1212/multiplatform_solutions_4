import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/widgets/resizeble_grid_view.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width < 700
          ? AppBar(
              backgroundColor: Colors.lightBlue,
              centerTitle: true,
              title: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(),
            ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: getPersons(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ConnectionState.done:
                {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Ошибка загрузки данных'),
                    );
                  } else {
                    List<Person> persons = snapshot.data!;
                    //return UserListView(persons: persons);
                    return width < 700
                        ? UserListView(persons: persons)
                        : ResizebleGridView(persons: persons);
                  }
                }
              default:
                {
                  return Container();
                }
            }
          },
        ),
      ),
    );
  }
}
