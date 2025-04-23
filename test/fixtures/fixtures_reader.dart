import 'dart:convert';
import 'dart:io';

class FixturesReader {
  static String readFixture(String fixturePath) {
    return File('test/fixtures/$fixturePath').readAsStringSync();
  }

  static String decodeFixture(String fixturePath) {
    final String fixtureContent = readFixture(fixturePath);
    return json.decode(fixtureContent);
  }
}
