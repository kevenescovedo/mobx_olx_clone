
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/create/screen_create.dart';
import 'package:xlo_mobx/store/page_store.dart';

import '../home/home_screen.dart';


class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore  = GetIt.I<PageStore>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reaction( (_) => pageStore.page, (int page) => pageController.jumpToPage(page));
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateScren(),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
          Container(color: Colors.purple,),
          Container(color: Colors.brown,),
        ],
      ),
    );
  }
}

