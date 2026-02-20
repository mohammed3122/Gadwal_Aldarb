import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: isDesktop ? kMainColor() : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: AssetImage(data.image)),
              SizedBox(width: 6),
              Flexible(
                child: FittedBox(
                  child: Text(
                    data.text,
                    style: TextStyle(
                      color: isDesktop ? Colors.white : Colors.black,
                      fontSize: getResponsiveFontSize(
                        context,
                        baseFontSize: 20,
                      ),
                    ),
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
