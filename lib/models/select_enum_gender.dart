import 'package:hive_flutter/hive_flutter.dart';
part 'select_enum_gender.g.dart';

@HiveType(typeId: 1)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
}
