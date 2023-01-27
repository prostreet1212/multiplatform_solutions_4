import 'dart:convert';

import 'package:flutter/material.dart';

import 'Model/person.dart';
import 'utils/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Person>> getPersons() async {
    List<Person> personList = [];
    String result = await fetchFileFromAssets('assets/persons.json');
    List<dynamic> persons = jsonDecode(result);
    personList = persons.map((e) => Person.fromJson(e)).toList();
    return personList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          /*shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(0),
            ),
          ),*/
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: getPersons(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case ConnectionState.done:
                  {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Ошибка загрузки данных'),
                      );
                    } else {
                      List<Person> persons = snapshot.data!;
                      return ListView.builder(
                          itemCount: persons.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) =>
                                        Container(
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
                                                    padding: EdgeInsets.only(top: 16,bottom: 16),
                                                    child:Column(
                                                      children: [
                                                        ElevatedButton(
                                                          style:
                                                          ElevatedButton.styleFrom(
                                                            //backgroundColor: Colors.white,
                                                            minimumSize:
                                                            const Size.fromHeight(
                                                                50), // NEW
                                                          ),
                                                          onPressed: () =>Navigator.pop(context),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.person,
                                                              size: 60,
                                                            ),
                                                            title: Text(
                                                              'ПРОФИЛЬ',
                                                              style: TextStyle(
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              right: 5, left: 5),
                                                          child: Container(
                                                            height: 3,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style:
                                                          ElevatedButton.styleFrom(
                                                            minimumSize:
                                                            const Size.fromHeight(
                                                                50), // NEW
                                                          ),
                                                          onPressed: () =>Navigator.pop(context),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.group,
                                                              size: 60,
                                                            ),
                                                            title: Text(
                                                              'ДРУЗЬЯ',
                                                              style: TextStyle(
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              right: 5, left: 5),
                                                          child: Container(
                                                            height: 3,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style:
                                                          ElevatedButton.styleFrom(
                                                            //primary: Colors.black,
                                                            minimumSize:
                                                            const Size.fromHeight(
                                                                50), // NEW
                                                          ),
                                                          onPressed: () =>Navigator.pop(context),
                                                          child: ListTile(
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
                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 3,
                                                          color: Colors.black,
                                                          indent: 5,
                                                          endIndent: 5,
                                                        )
                                                      ],
                                                    )
                                                    ,),
                                            ],
                                          ),
                                        ),

                                );
                                  /*Wrap(
                                          children: [
                                            Container(
                                              child: Container(
                                                decoration: new BoxDecoration(
                                                    color:  Colors.red,
                                                    borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(25.0),
                                                        topRight: const Radius.circular(25.0))),
                                                child: Padding(
                                                  padding: EdgeInsets.only(top: 16,bottom: 16),
                                                  child:Column(
                                                    children: [
                                                      ElevatedButton(
                                                        style:
                                                        ElevatedButton.styleFrom(
                                                          //primary: Colors.black,
                                                          minimumSize:
                                                          const Size.fromHeight(
                                                              50), // NEW
                                                        ),
                                                        onPressed: () {},
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons.person,
                                                            size: 60,
                                                          ),
                                                          title: Text(
                                                            'ПРОФИЛЬ',
                                                            style: TextStyle(
                                                                fontSize: 36,
                                                                fontWeight:
                                                                FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 5, left: 5),
                                                        child: Container(
                                                          height: 3,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style:
                                                        ElevatedButton.styleFrom(
                                                          minimumSize:
                                                          const Size.fromHeight(
                                                              50), // NEW
                                                        ),
                                                        onPressed: () {},
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons.group,
                                                            size: 60,
                                                          ),
                                                          title: Text(
                                                            'ДРУЗЬЯ',
                                                            style: TextStyle(
                                                                fontSize: 36,
                                                                fontWeight:
                                                                FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 5, left: 5),
                                                        child: Container(
                                                          height: 3,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style:
                                                        ElevatedButton.styleFrom(
                                                          //primary: Colors.black,
                                                          minimumSize:
                                                          const Size.fromHeight(
                                                              50), // NEW
                                                        ),
                                                        onPressed: () {},
                                                        child: ListTile(
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
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                  ,),
                                              ),
                                            )
                                          ],
                                        ),
                                );*/
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 229, 229, 218),
                                        radius: 32,
                                        backgroundImage: AssetImage(
                                            'assets/images/my_photo.jpg'),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            persons[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            persons[index].email,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }
                default:
                  {
                    return Container();
                  }
              }
            },
          ),
        ));
  }
}
