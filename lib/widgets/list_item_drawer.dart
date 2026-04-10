import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gadwal_aldarb/models/drawer_item_model.dart';
import 'package:gadwal_aldarb/widgets/item_drawer.dart';

class ListItemDrawer extends StatelessWidget {
  const ListItemDrawer({super.key, required this.isDesktop});
  final bool isDesktop;
  static List<DrawerItemModel> data = [
    DrawerItemModel(
      iconColor: Color(0xff0061c4),
      icon: FontAwesomeIcons.linkedin,
      text: 'Mohammad Abd-Allatif',
    ),
    DrawerItemModel(
      icon: FontAwesomeIcons.telegram,
      text: 'MohammadAwd3',
      iconColor: Color(0xff26a2e0),
    ),
    DrawerItemModel(
      iconColor: Color(0xff35dd54),
      icon: FontAwesomeIcons.whatsapp,
      text: '01288128468',
    ),
    DrawerItemModel(
      icon: FontAwesomeIcons.facebook,
      text: 'مُحـمَّـد عبداللطيف عوض',
      iconColor: Color(0xff4267B2),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return
    //  Expanded(
    //   flex: 3,
    //   child:
    Column(
      children: data
          .map((item) => ItemDrawer(data: item, isDesktop: isDesktop))
          .toList(),
      //   ItemDrawer(data: data[0]),
      //   ItemDrawer(data: data[1]),
      //   ItemDrawer(data: data[2]),
      //   ItemDrawer(data: data[3]),

      // ),
    );
  }
}
