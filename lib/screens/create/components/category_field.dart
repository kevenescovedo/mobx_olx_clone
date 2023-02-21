
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';

import 'package:xlo_mobx/store/create_store.dart';

class CategoryField extends StatelessWidget {
  final CreateStore store;
  const CategoryField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {

   return ListTile(

     onTap: () async {
     Category? category = await showDialog(context: context, builder: (_) => CategoryScreen(showAll: false, selected: store.category,));
     if(category != null) {
       store.setCategory(category);
     }
     },
     title: Text("Categoria *",
       style: TextStyle(fontWeight: FontWeight.w800,
         color: Colors.grey,
         fontSize: 18
       ),
     ),
     subtitle: store.category == null ? null : Text(store.category!.description!,
       style: TextStyle(
         color: Colors.black,
         fontSize: 17
       ),
     ),
     trailing: Icon(Icons.keyboard_arrow_down),
   );
    });
  }
}
