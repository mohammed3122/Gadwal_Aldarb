import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gadwal_aldarb/helper/services/social_media_services.dart';
import 'package:gadwal_aldarb/models/drawer_item_model.dart';
import 'package:gadwal_aldarb/widgets/item_drawer.dart';

class ListItemDrawer extends StatelessWidget {
  const ListItemDrawer({super.key, required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> data = [
      DrawerItemModel(
        iconColor: Color(0xff0061c4),
        icon: FontAwesomeIcons.linkedin,
        text: 'Mohammad Abd-Allatif',
        onTap: () {
          launchLinkedInAndFaceBookAndTelegramAndOther(
            url: 'https://www.linkedin.com/in/mohammad-awd-3m',
            errorMessage: 'عذرا .. لا يمكن فتح تطبيق لينكد إن ',
            context: context,
          );
        },
      ),
      DrawerItemModel(
        icon: FontAwesomeIcons.telegram,
        text: 'MohammadAwd3',
        iconColor: Color(0xff26a2e0),
        onTap: () {
          launchLinkedInAndFaceBookAndTelegramAndOther(
            url: 'https://t.me/MohammadAwd3',
            errorMessage: 'عذرا .. لا يمكن فتح تطبيق التليجرام ',
            context: context,
          );
        },
      ),
      DrawerItemModel(
        iconColor: Color(0xff35dd54),
        icon: FontAwesomeIcons.whatsapp,
        text: '01288128468',
        onTap: () {
          launchWhatsApp(
            phone: '201288128468',
            errorMessage: 'عذرا .. لا يمكن فتح تطبيق الواتساب ',
            context: context,
          );
        },
      ),
      DrawerItemModel(
        onTap: () {
          launchLinkedInAndFaceBookAndTelegramAndOther(
            url: 'https://www.facebook.com/mohammad.awd.2025',
            errorMessage: 'عذرا .. لا يمكن فتح تطبيق التليجرام ',
            context: context,
          );
        },
        icon: FontAwesomeIcons.facebook,
        text: 'مُحـمَّـد عبداللطيف عوض',
        iconColor: Color(0xff4267B2),
      ),
    ];
    return Column(
      children: data
          .map((item) => ItemDrawer(data: item, isDesktop: isDesktop))
          .toList(),
    );
  }
}
