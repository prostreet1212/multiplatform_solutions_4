import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/widgets/resizeble_card.dart';

import '../Model/person.dart';

class ResizebleGridView extends StatelessWidget {
  ResizebleGridView({Key? key, required this.persons}) : super(key: key);

  List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: persons
          .map(
            (person) => ResizebleCard(person: person),
          )
          .toList(),
    );
  }
}
