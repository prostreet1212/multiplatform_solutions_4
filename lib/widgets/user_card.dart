import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/Model/person.dart';

import 'menu_bottom_sheet.dart';

class UserCard extends StatelessWidget {
   UserCard({Key? key,required this.user}) : super(key: key);

  Person user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => MenuBottomSheet(),
        );
      },
      child: Card(
        color: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 229, 229, 218),
                radius: 32,
                backgroundImage: AssetImage('assets/images/dom.jpg'),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
