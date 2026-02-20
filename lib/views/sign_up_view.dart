import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/helper/services/gender_selector_serviece.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/models/user_model.dart';
import 'package:gadwal_aldarb/views/home_view.dart';
import 'package:gadwal_aldarb/widgets/Cusotm_text_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  Gender? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _onContinue() async {
    if (_nameController.text.trim().isEmpty || _selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك اكتب الاسم واختر النوع')),
      );
      return;
    }

    final Box<WhoUser> usersBox = Hive.box<WhoUser>('users');
    final WhoUser user = WhoUser(
      name: _nameController.text.trim(),
      gender: _selectedGender!,
    );

    await usersBox.put('current_user', user);

    final WhoUser? savedUser = usersBox.get('current_user');
    if (savedUser != null) {
      print(
        'Saved user => name: ${savedUser.name}, gender: ${savedUser.gender.name}',
      );
    }

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: const Text('أتعرف بيك .. !'),
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
                Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/logo_app.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(nameController: _nameController),
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
                ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor(),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('متابعة', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
