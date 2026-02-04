import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/models/drawer_item_model.dart';
import 'package:gadwal_aldarb_res/widgets/item_drawer.dart';

class ListItemDrawer extends StatelessWidget {
  const ListItemDrawer({super.key});
  static List<DrawerItemModel> data = [
    DrawerItemModel(
      image: 'assets/images/social_media/linked_logo.png',
      text: 'Mohammad Abd-Allatif',
    ),
    DrawerItemModel(
      image: 'assets/images/social_media/tle_logp.png',
      text: 'MohammadAwd3',
    ),
    DrawerItemModel(
      image: 'assets/images/social_media/whats_logp.jpg',
      text: '01288128468',
    ),
    DrawerItemModel(
      image: 'assets/images/social_media/facebook_logo.png',
      text: 'مُحـمَّـد عبداللطيف عوض',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          ItemDrawer(data: data[0]),
          ItemDrawer(data: data[1]),
          ItemDrawer(data: data[2]),
          ItemDrawer(data: data[3]),
        ],
      ),
    );
  }
}
