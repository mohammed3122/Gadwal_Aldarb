import 'package:flutter/material.dart';

class DevButton extends StatelessWidget {
  const DevButton({super.key, required this.scafoldKey});

  final GlobalKey<ScaffoldState> scafoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 7)],
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: FittedBox(
          child: IconButton(
            icon: Icon(Icons.developer_mode, size: 35, color: Colors.blue),
            onPressed: () {
              scafoldKey.currentState!.openDrawer();
            },
          ),
        ),
      ),
    );
  }
}
