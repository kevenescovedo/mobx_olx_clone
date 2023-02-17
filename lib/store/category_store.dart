import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/category_repository.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
 _CategoryStore() {
_loadCategories();
 }
 @action
 void setCategoires(List<Category> categories) {
  categoryList.clear();
  categoryList.addAll(categories);
 }
 @action
 setError(String? value) => error = value;
 String? error ;
 @computed
 List<Category>  get allCateogryList => List.from(categoryList)..insert(0, Category(id: '#', description: 'Todos'));

 ObservableList<Category> categoryList = ObservableList();
 Future<void> _loadCategories() async{
  try {
   final categories = await CategoryRepository().getList();
   setCategoires(categories);
  }
  catch (e) {
   setError(e.toString());
  }
 }
}