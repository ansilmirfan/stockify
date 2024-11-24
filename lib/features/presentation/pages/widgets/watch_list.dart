import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/widgets/custom_listtile.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const [
          CustomListtile(
            title: 'title 1',
            subtitle: 'subtitle',
            trailingSubtitle: 'sub',
            trailingTitle: 'tiele',
          ),
          CustomListtile(
            title: 'another',
            subtitle: 'sub',
            isIcon: true,
          )
        ],
      ),
    );
  }
}
