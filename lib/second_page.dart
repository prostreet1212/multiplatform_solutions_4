import 'package:flutter/material.dart';

import 'Model/person.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key, required this.persons}) : super(key: key);
  List<Person> persons;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: widget.persons
          .map((e) => Container(
                width: 25,
                height: 25,
                color: Colors.green,
              ),
      )
          .toList(),
    );
  }
}
