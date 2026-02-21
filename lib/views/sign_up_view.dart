import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/widgets/continue_btn.dart';
import 'package:gadwal_aldarb/widgets/gender_selector_widget.dart';
import 'package:gadwal_aldarb/helper/services/tts_service.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/widgets/Cusotm_text_field.dart';
import 'package:gadwal_aldarb/widgets/logo_app.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  Gender? _selectedGender;
  @override
  void initState() {
    super.initState();
    Speaker.instance.speak('السلامُ عَلَيكم  \n\n  نِتْعَرَّفْ الأَوَّلْ ');
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: Text(
          'نتعَـرَّف الأول ... !',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveFontSize(context, baseFontSize: 28),
          ),
        ),
        backgroundColor: kMainColor(),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kMainColor().withValues(alpha: 0.25),
            ),
            child: ListView(
              children: [
                LogoApp(),
                const SizedBox(height: 20),
                CustomTextField(nameController: nameController),
                const SizedBox(height: 50),
                Text(
                  'ولد ولا بنت !',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, baseFontSize: 30),
                  ),
                ),
                const SizedBox(height: 8),
                GenderSelector(
                  selectedGender: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                ContinueButton(
                  nameController: nameController,
                  mounted: mounted,
                  selectedGender: _selectedGender,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
