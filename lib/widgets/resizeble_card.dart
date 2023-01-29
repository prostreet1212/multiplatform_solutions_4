import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/Model/person.dart';
import 'package:popover/popover.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'menu_bottom_sheet.dart';
/*
class ResizebleCard extends StatelessWidget {
  ResizebleCard({Key? key, required this.person}) : super(key: key);
  Person person;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        showPopover(
          transition: PopoverTransition.scale,
          width: MediaQuery.of(context).size.width / 3.6,
          context: context,
          bodyBuilder: (context) =>
              LayoutBuilder(builder: (context, constraints) {
            return MenuBottomSheet();
          }),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.lightBlueAccent,
        //child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 229, 229, 218),
                  radius: constraints.maxWidth / 3.6,
                  backgroundImage: AssetImage('assets/images/dom.jpg'),
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
        //),
      ),
    );
  }
}
*/

class ResizebleCard extends StatefulWidget {
   const ResizebleCard({Key? key, required this.person}) : super(key: key);
   
  final Person person;
  @override
  State<ResizebleCard> createState() => _ResizebleCardState();


}

class _ResizebleCardState extends State<ResizebleCard> {
  SuperTooltip? tooltip;

  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip!.isOpen) {
      tooltip!.close();
      return false;
    }
    return true;
  }

  void onTap() {
    if (tooltip != null && tooltip!.isOpen) {
      tooltip!.close();
      return;
    }

    var renderBox = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context)!.context
        .findRenderObject() as RenderBox?;

    var targetGlobalCenter = renderBox
        .localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

    // We create the tooltip on the first use
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.left,
      arrowTipDistance: 15.0,
      arrowBaseWidth: 40.0,
      arrowLength: 40.0,
      borderColor: Colors.green,
      borderWidth: 5.0,
      snapsFarAwayVertically: true,
      showCloseButton: ShowCloseButton.inside,
      hasShadow: false,
      touchThrougArea: new Rect.fromLTWH(targetGlobalCenter.dx - 100,
          targetGlobalCenter.dy - 100, 200.0, 160.0),
      touchThroughAreaShape: ClipAreaShape.rectangle,
      content: new Material(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, "
                  "sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, "
                  "sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
              softWrap: true,
            ),
          )),
    );

    //tooltip!.show(context);
  }


  

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        //tooltip!.show(context);
       /*showPopover(
          //direction: PopoverDirection.top,
          width: 300,
          context: context,
          constraints: BoxConstraints(),
          bodyBuilder: (context) =>
          MenuBottomSheet(),
        );*/
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.lightBlueAccent,
        //child: Center(
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
                  widget.person.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth / 18),
                ),
                SizedBox(
                  height: constraints.maxWidth / 50,
                ),
                Text(
                  widget.person.email,
                  style: TextStyle(fontSize: constraints.maxWidth / 22),
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

