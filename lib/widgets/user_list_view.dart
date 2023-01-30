import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_4/widgets/user_card.dart';
import '../Model/person.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key, required this.persons}) : super(key: key);

  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return UserCard(user: persons[index]);
        });
  }
}
