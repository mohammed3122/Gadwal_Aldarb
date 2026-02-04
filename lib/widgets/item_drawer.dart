import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb_res/models/drawer_item_model.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key, required this.data});
  final DrawerItemModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      //
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: AssetImage(data.image)),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  data.text,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, baseFontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
