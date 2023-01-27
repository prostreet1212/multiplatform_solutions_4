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
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: widget.persons
          .map((person) => Container(
                color: Colors.green,
        child: Column(
          children: [
        CircleAvatar(
        backgroundColor: Color.fromARGB(255, 229, 229, 218),
        radius: 32,
        backgroundImage: AssetImage('assets/images/my_photo.jpg'),
        ),
            Text(
              person.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              person.email,
              style: TextStyle(fontSize: 16),
            ),
        ],
        ),
              ),
      )
          .toList(),
    );
  }
}
