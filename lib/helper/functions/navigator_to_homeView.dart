import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/services/tts_service.dart';
import 'package:gadwal_aldarb/helper/services/user_services.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/models/user_model.dart';
import 'package:gadwal_aldarb/views/home_view.dart';
import 'package:gadwal_aldarb/widgets/messanger_snackBar.dart';

Future<void> onContinue({
  required BuildContext context,
  required TextEditingController nameController,
  required bool mounted,
  required Gender? selectedGender,
}) async {
  if (nameController.text.trim().isEmpty || selectedGender == null) {
    Speaker.instance.speak('نِدَخَّلْ البياناتْ الأَوَّلْ');

    return showSnackBarMessage(
      context,
      message: 'ندخل البيانات الأول',
      icon: Icons.warning_rounded,
      colorIcon: Colors.red,
      backgroundColor: kMainColor(),
    );
  }

  final user = WhoUser(
    name: nameController.text.trim(),
    gender: selectedGender,
  );

  UserService.saveUser(user);

  if (!mounted) return;

  Navigator.pushReplacementNamed(context, HomeView.id);
}
