import 'package:flutter/material.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'ПРОФИЛЬ',
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: 60,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'ДРУЗЬЯ',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_chart_outlined,
                          size: 60,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'ОТЧЕТ',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    )
                    /*ListTile(
                                                            leading: Icon(
                                                              Icons.add_chart_outlined,
                                                              size: 60,
                                                            ),
                                                            title: Text(
                                                              'ОТЧЕТ',
                                                              style: TextStyle(
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),*/
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}