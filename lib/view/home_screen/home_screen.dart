import 'package:first_api/view/all_news/all_news.dart';
import 'package:first_api/view/braking_news/braking_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title:const Text("News App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
            centerTitle:  true,
            backgroundColor: Colors.black,
            bottom:const TabBar(
              dividerColor: Colors.black,
              indicatorColor: Colors.white,
                indicatorWeight: 0,
                indicator:BoxDecoration(
                  borderRadius: BorderRadius.zero
                ),
                labelColor: Colors.red,
                unselectedLabelColor: Colors.white,
                tabs: [
              Tab(text: "Braking News",),
              Tab(text: "All News",),
            ]),
          ),
          body:const TabBarView(
            children: [
              BrakingNews(),
              AllNews(),

            ],
          ),
    ),
    );
  }
}
