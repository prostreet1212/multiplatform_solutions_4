import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/Model/person.dart';
import 'package:popover/popover.dart';

import 'menu_bottom_sheet.dart';

class ResizebleCard extends StatelessWidget {
  const ResizebleCard({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          transition: PopoverTransition.scale,
          width: MediaQuery.of(context).size.width / 3.1,
          context: context,
          bodyBuilder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              return const MenuBottomSheet();
            },
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.lightBlueAccent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 229, 229, 218),
                  radius: constraints.maxWidth / 3.6,
                  backgroundImage: const AssetImage('assets/images/dom.jpg'),
                ),
                SizedBox(
                  height: constraints.maxWidth / 30,
                ),
                Text(
                  person.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth / 18),
                ),
                SizedBox(
                  height: constraints.maxWidth / 50,
                ),
                Text(
                  person.email,
                  style: TextStyle(fontSize: constraints.maxWidth / 22),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
