import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/helper/functions/text_field_shape.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        labelText: 'اسمك ايه ... ؟ ',

        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: getResponsiveFontSize(context, baseFontSize: 30),
        ),
        border: textFieldShape(),
        enabledBorder: textFieldShape(),
        focusedBorder: textFieldShape(),
      ),
      cursorColor: kMainColor(),
    );
  }
}
