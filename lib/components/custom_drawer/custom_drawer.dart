import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer_header.dart';
import 'package:xlo_mobx/components/custom_drawer/page_section.dart';
import 'package:xlo_mobx/store/user_maneger_store.dart';
class CustomDrawer extends StatelessWidget {

   CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        child: Drawer(
          child: ListView(children: [
            CustomDrawerHeader(),
            PageSection()
          ],),
        ),
        width: MediaQuery.of(context).size.width * 0.65,
      ),
    ));
  }
}
