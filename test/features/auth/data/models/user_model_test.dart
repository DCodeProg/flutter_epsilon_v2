import 'package:flutter_epsilon_v2/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_epsilon_v2/features/auth/data/models/user_model.dart';

void main() {
  final tUserModel = UserModel(
    id: "1",
    email: "test@test.test",
    nom: "test",
    prenom: "test",
  );

  test("should be a subclass of User entity", () {
    // assert
    expect(tUserModel, isA<User>());
  });

  group(
    "toMap",
    () {
      test(
        "test description",
        () {},
      );
    },
  );

  group(
    "fromMap",
    () {
      test(
        "test description",
        () {},
      );
    },
  );

  group(
    "toJson",
    () {
      test(
        "test description",
        () {},
      );
    },
  );

  group(
    "fromJson",
    () {
      test(
        "test description",
        () {},
      );
    },
  );
}
