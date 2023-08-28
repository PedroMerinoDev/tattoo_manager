import 'package:faker/faker.dart';

class ApiFactory {
  static Map makeAccountJson() =>
      {'accessToken': faker.guid.guid(), 'name': faker.person.name()};
}
