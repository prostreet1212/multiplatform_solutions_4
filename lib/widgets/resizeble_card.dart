import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/Model/person.dart';
import 'package:multiplatform_solutions_4/widgets/menu_bottom_sheet.dart';
import 'package:popover/popover.dart';

class ResizebleCard extends StatelessWidget {
   ResizebleCard({Key? key,required this.person}) : super(key: key);
  Person person;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showPopover(
          width: MediaQuery.of(context).size.width/2.3,
            context: context,
            bodyBuilder: (context)=>MenuBottomSheet(),);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.lightBlueAccent,
        //child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 229, 229, 218),
              radius: 80,
              backgroundImage: AssetImage('assets/images/my_photo.jpg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              person.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              person.email,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        //),
      ),
    );
  }
}
