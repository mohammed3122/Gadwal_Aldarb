import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gadwal_aldarb/consts.dart';
import 'package:gadwal_aldarb/helper/functions/responsive_font_size.dart';
import 'package:gadwal_aldarb/models/drawer_item_model.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key, required this.data, required this.isDesktop});
  final DrawerItemModel data;
  final bool isDesktop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: isDesktop ? kMainColor() : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                Flexible(
                  child: FaIcon(data.icon, color: data.iconColor, size: 30),
                ),
                SizedBox(width: 25),
                Center(
                  child: Text(
                    data.text,
                    style: TextStyle(
                      color: isDesktop ? Colors.white : Colors.black,
                      fontSize: getResponsiveFontSize(
                        context,
                        baseFontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
