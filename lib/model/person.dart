class Person {
  late String name;
  late String email;

  Person({required this.name, required this.email});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }
}
