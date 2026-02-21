import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/navigator_to_homeView.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required TextEditingController nameController,
    required this.mounted,
    required Gender? selectedGender,
  }) : _nameController = nameController,
       _selectedGender = selectedGender;

  final TextEditingController _nameController;
  final bool mounted;
  final Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onContinue(
          context: context,
          nameController: _nameController,
          mounted: mounted,
          selectedGender: _selectedGender,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kMainColor(),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: const Text('متابعة', style: TextStyle(fontSize: 30)),
    );
  }
}
