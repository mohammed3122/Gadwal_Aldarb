import 'package:flutter/material.dart';
import 'package:gadwal_aldarb_res/views/drawer_view.dart';
import 'package:gadwal_aldarb_res/widgets/dev_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scafoldKey = GlobalKey();
    return Scaffold(
      key: scafoldKey,
      drawer: DrawerView(),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        leading: DevButton(scafoldKey: scafoldKey),
        centerTitle: true,
        backgroundColor: Color(0xff338b7a),
        title: Text(
          'اختر رقم لعرض جدول ضربه',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // body:
    );
  }
}
