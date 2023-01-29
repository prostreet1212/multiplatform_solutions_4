import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/widgets/resizeble_card.dart';

import '../Model/person.dart';

class ResizebleGridView extends StatelessWidget {
 const ResizebleGridView({Key? key, required this.persons}) : super(key: key);

 final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: [
            Container(
              color: Colors.lightBlue,
              //width: 45,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: const [
                      Text(
                        'Adaptive App',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            )
          ],
        ),
        Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: persons
                  .map(
                    (person) => ResizebleCard(person: person),
                  )
                  .toList(),
            ),
        )
      ],
    );
  }
}
