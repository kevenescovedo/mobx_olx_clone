import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/store/category_store.dart';
import 'package:xlo_mobx/store/page_store.dart';
import 'package:xlo_mobx/store/user_maneger_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  initializeParse();
  setUpLocators();
  runApp(MyApp());
  /*await Parse().initialize("xDqjFM5T8Ycm6udk6SyHRTnnno1OTwicsdgNstKH",
      "https://parseapi.back4app.com/",
      clientKey: "HKYCVBDpZOpcqYtrbaHBur90YdUKsALZFowh1CkL",
    autoSendSessionId: true,
    debug: true
  ); */
 /* final category = ParseObject("Categories");
  category.set<String>("Title", "Meais");
  category.set<int>("Position",1 );
  final response = await category.save();
  print(response.success); */
  /*final category = ParseObject('Categories')..objectId  =  "9C0ZzFcQYk"
    ..set("Position", 3);
  final response = await category.save();
  print(response.success); */

  // remover
 /* final category = ParseObject('Categories')..objectId  =  "0ErMJflVxM";
  category.delete(); */
  //lendo um objeto
 /* final response = await ParseObject("Categories").getObject("9C0ZzFcQYk"); */
 /* final response = await ParseObject("Categories").getAll();
 if(response.success) {
  // print(response.result);
  /* for(final object  in response.result) {
     print(object);

   }*/
   final query = QueryBuilder(ParseObject("Categories"));
   //query.whereEqualTo('Position', 3);
   query.whereContains("Title", "Meais");
   
   final response = await query.query();
   if(response.success) {
      print(response.result);


   }*/


 }

Future<void> initializeParse() async {
  await Parse().initialize("xDqjFM5T8Ycm6udk6SyHRTnnno1OTwicsdgNstKH",
      "https://parseapi.back4app.com/",
      clientKey: "HKYCVBDpZOpcqYtrbaHBur90YdUKsALZFowh1CkL",
      autoSendSessionId: true,
      debug: true
  );
}
void setUpLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManegerStore());
  GetIt.I.registerSingleton(CategoryStore());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "XLO",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(elevation: 0)
      ),
      home: BaseScreen(),
    );
  }
}
