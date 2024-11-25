import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/pages/widgets/custom_tabbar.dart';
import 'package:stockify/features/presentation/pages/widgets/home_view.dart';
import 'package:stockify/features/presentation/pages/widgets/watch_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: TabBarView(children: [
          HomeView(),
          WatchList(),
        ]),
        bottomSheet: CustomTabbar(),
      ),
    );
  }
}
