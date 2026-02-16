import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gadwal_aldarb_res/consts.dart';
import 'package:gadwal_aldarb_res/helper/functions/create_exam.dart';
import 'package:gadwal_aldarb_res/helper/services/tts_service.dart';
import 'package:gadwal_aldarb_res/views/gadwal_aldarb_view.dart';
import 'package:gadwal_aldarb_res/views/typing_exam.dart';

class FlatingActionButtonDial extends StatelessWidget {
  const FlatingActionButtonDial({super.key, required this.widget});

  final GadwalAldarbView widget;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      onOpen: () {
        Speaker.instance.speak(
          'شاطرْ يا مُهابْ \n\nاسْتَعِدَّ يَلَّا للإختبارْ',
        );
      },
      buttonSize: Size(60.0, 60.0),
      icon: Icons.quiz_outlined,
      tooltip: 'اختبار',
      activeIcon: Icons.close,
      backgroundColor: kMainColor,
      foregroundColor: Colors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      spacing: 3,
      spaceBetweenChildren: 14,
      children: [
        createExam(
          widget: widget,
          label: 'اختبار شفوي',
          icon: Icons.record_voice_over,
          onTap: () {},
        ),
        createExam(
          widget: widget,
          label: 'اختبار تحريري',
          icon: Icons.edit_note_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TypingExam(number: widget.number!);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
