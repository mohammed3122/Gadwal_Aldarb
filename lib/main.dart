import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';
import 'package:gadwal_aldarb_res/views/home_view.dart';
import 'package:gadwal_aldarb_res/views/typing_exam.dart';

void main() {
  runApp(const GadwalAldarb());
}

class GadwalAldarb extends StatelessWidget {
  const GadwalAldarb({super.key});

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
      home: HomeView(),
    );
  }
}
