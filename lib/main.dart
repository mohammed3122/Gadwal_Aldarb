import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/models/select_enum_gender.dart';
import 'package:gadwal_aldarb/models/user_model.dart';
import 'package:gadwal_aldarb/views/gadwal_aldarb_view.dart';
import 'package:gadwal_aldarb/views/home_view.dart';
import 'package:gadwal_aldarb/views/sign_up_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WhoUserAdapter());
  Hive.registerAdapter(GenderAdapter());
  await Hive.openBox<WhoUser>('users');

  runApp(GadwalAldarb(initialUser: savedUser));
}

class GadwalAldarb extends StatelessWidget {
  const GadwalAldarb({super.key, this.initialUser});

  final WhoUser? initialUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GadwalAldarbView.id: (context) => GadwalAldarbView(),
        // TypingExam.id: (context) => TypingExam(number: null,),
      },
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [Locale('ar', 'EG')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: initialUser != null && initialUser!.name.trim().isNotEmpty
          ? const HomeView()
          : const SignUpView(),
    );
  }
}
