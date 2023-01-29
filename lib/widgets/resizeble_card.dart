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
          arrowDxOffset: 100,
          direction: PopoverDirection.bottom,
          transition: PopoverTransition.other,
          width: MediaQuery.of(context).size.width/2.7,
            context: context,
            bodyBuilder: (context)=>MenuBottomSheet(),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.lightBlueAccent,
        //child: Center(
        child: LayoutBuilder(
          builder: (context,constraints){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 229, 229, 218),
                  radius: constraints.maxWidth/4,
                  backgroundImage: AssetImage('assets/images/dom.jpg'),
                ),
                SizedBox(
                  height: constraints.maxWidth/30,
                ),
                Text(
                  person.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: constraints.maxWidth/18),
                ),
                SizedBox(
                  height: constraints.maxWidth/50,
                ),
                Text(
                  person.email,
                  style: TextStyle(fontSize: constraints.maxWidth/22),
                ),
              ],
            );
          },
        ),
        //),
      ),
    );
  }
}
