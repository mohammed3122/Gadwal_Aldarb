import 'package:flutter/material.dart';
import 'package:gadwal_aldarb/widgets/close_btn_in_msg.dart';
import 'package:gadwal_aldarb/widgets/message_info_row.dart';
import 'package:gadwal_aldarb/widgets/quote_card_form_dev.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({super.key, required this.start, required this.end});

  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            icon: Icons.info_outline_rounded,
            iconColor: start,
            iconBg: start.withAlpha(26), // 0.1 * 255
            text:
                'أعمل بشغف على تطوير تطبيقات مبتكرة وعالية الجودة، ولديّ خبرة واسعة في تصميم وتطوير التطبيقات باستخدام Flutter، أسعى دائمًا لتقديم أفضل تجربة للمستخدمين.',
          ),
          const Divider(height: 24),
          InfoRow(
            icon: Icons.layers_outlined,
            iconColor: end,
            iconBg: end.withAlpha(26), // 0.1 * 255
            text:
                'أسعى دائمًا بفضل الله تبارك وتعالى لإنتاج تطبيقات ذات طابع عربي وإسلامي تُفيد مجتمعنا العربي والإسلامي، وتساعد أطفالنا في عدم الانغماس في دنس التكنولوجيا وما يتعلق بها .. \nبإذن الله فهو المُستعان.',
          ),
          const SizedBox(height: 10),

          // Quote Card
          QuoteCardFromDeveloper(end: end, start: start),
          const SizedBox(height: 15),

          // Close Button
          CloseBtnInMsg(start: start, end: end),
        ],
      ),
    );
  }
}
