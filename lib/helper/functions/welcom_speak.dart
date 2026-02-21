import 'package:gadwal_aldarb/helper/services/tts_service.dart';
import 'package:gadwal_aldarb/helper/services/user_services.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';

Future<void> welcom() async {
  String finalName = UserService.getCurrentUser()!.name.replaceFirst('م', 'مُ');

  if (UserService.getCurrentUser()!.gender == Gender.male) {
    await Speaker.instance.speak(
      'إِزَّيَّكْ    يا $finalName  \n\n\n   يَلْلا إخْتَارْ رَقَمْ عَشانْ تِحْفَظْ جَدْوَلْ ضَرْبُهْ',
    );
  } else {
    await Speaker.instance.speak(
      ' إِزَّيِّكْ   يا $finalName  \n\n\n   يَلْلا إِخْتَاري رَقَمْ عَشانْ تِحْفَظي جَدْوَلْ ضَرْبُهْ',
    );
  }
}
