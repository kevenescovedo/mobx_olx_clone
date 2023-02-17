import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/store/create_store.dart';

import 'components/imagefield/image_field.dart';
class CreateScren extends StatelessWidget {
  CreateScren({Key? key}) : super(key: key);
  CreateStore store = CreateStore();
  @override
  Widget build(BuildContext context) {
    final labelStyle =  TextStyle(fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    );
    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar Anúncio"),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)

        ),
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageField(store: store,),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Titulo",
              labelStyle: labelStyle,
              contentPadding: contentPadding,
            ),

          ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Descrição",
                labelStyle: labelStyle,
                contentPadding: contentPadding,

              ),
             maxLines: null,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Preço",
                labelStyle: labelStyle,
                prefixText: 'R\$',
                contentPadding: contentPadding,
              ),
             keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(moeda: true)
              ],
            )
        ],),
      ),
    );
  }
}
