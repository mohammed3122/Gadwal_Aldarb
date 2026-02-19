import 'package:gadwal_aldarb_res/helper/services/gender_selector_serviece.dart';
import 'package:gadwal_aldarb_res/models/select_enum_gender.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class WhoUser extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final Gender gender;

  WhoUser({required this.name, required this.gender});
}
