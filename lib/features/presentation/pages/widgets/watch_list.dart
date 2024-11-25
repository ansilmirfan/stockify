import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockify/features/presentation/provider/local_storage.dart';
import 'package:stockify/features/presentation/widgets/custom_listtile.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<LocalStorage>(
        builder: (context, value, child) {
          if (value.data.isEmpty) {
            return const Center(
              child: Text('Looks like nothing in the watchlist'),
            );
          } else {
            return ListView.builder(
              itemCount: value.data.length,
              itemBuilder: (context, index) => CustomListtile(
                dismissible: true,
                id: value.data[index].id,
                title: value.data[index].companyName,
                subtitle: value.data[index].symbol,
                maxline: 1,
                trailingTitle: 'nothing',
                trailingSubtitle: 'nothingeler',
              ),
            );
          }
        },
      )),
    );
  }
}
