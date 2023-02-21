
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/store/category_store.dart';


import '../../components/error_box/error_box.dart';
import '../../models/category.dart';
class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, this.showAll = true, this.selected = null}) : super(key: key);
  final Category? selected ;
  final bool showAll;
  CategoryStore store = GetIt.I<CategoryStore>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        centerTitle: true,
      ),
      body: Center(child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
        child:  Observer(builder: (_) {
          if(store.error != null) {
            return ErrorBox(
             message: store.error,
            );
          } else if(store.categoryList.isEmpty) {
             return CircularProgressIndicator();
          }
          else {
            final categories =  showAll ? store.allCateogryList : store.categoryList;
            return ListView.separated(itemBuilder: (_,index) {
              final category = categories[index];
              return InkWell(
                onTap: (){
                  print("NA TELAAA CATEGORYYY");
                  print(category!.description);
                  Navigator.pop(context,category);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  color: category.id == selected?.id ?Colors.purple.withAlpha(50): null,
                  child: Text(category.description!,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: category.id == selected?.id ? FontWeight.bold: null,
                    ),
                  ),
                ),
              );
            }, separatorBuilder: (_,__) {
              return Divider(height: 0.1, color: Colors.grey,);
            }, itemCount: categories.length);
          }
          },)

        ),
      ),);

  }
}
