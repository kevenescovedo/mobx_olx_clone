import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/login/login_screen.dart';
import 'package:xlo_mobx/store/user_maneger_store.dart';

import '../../store/page_store.dart';
class CustomDrawerHeader extends StatelessWidget {
  final UserManegerStore store = GetIt.I<UserManegerStore>();
  CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if(store.isUserLogged) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.white, size: 35,),
            SizedBox(width: 20,),
            Expanded(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(store.isUserLogged ? store.user!.name! : "Acesse sua conta" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),),
                Text(store.isUserLogged ? store.user!.email! : "Clique aqui", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
              ],),)

          ],
        ),),
    );
  }
}
