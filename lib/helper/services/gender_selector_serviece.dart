import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';

enum Gender { male, female }

class GenderSelector extends StatelessWidget {
  final Gender? selectedGender;
  final ValueChanged<Gender?> onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioGroup<Gender>(
      groupValue: selectedGender,
      onChanged: onChanged,
      child: Column(
        children: [
          RadioListTile<Gender>(
            activeColor: kMainColor(),
            value: Gender.male,
            title: Text(
              'ولد 👦🏻',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, baseFontSize: 30),
              ),
            ),
          ),
          RadioListTile<Gender>(
            activeColor: kMainColor(),
            value: Gender.female,
            title: Text(
              'بنت 🧕🏻',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, baseFontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
