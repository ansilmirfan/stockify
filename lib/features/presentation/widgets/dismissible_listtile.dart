// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockify/features/presentation/provider/local_storage.dart';

class DismissibleListTile extends StatefulWidget {
  final Widget child;
  final int id;

  const DismissibleListTile({super.key, required this.child, required this.id});

  @override
  _DismissibleListTileState createState() => _DismissibleListTileState();
}

class _DismissibleListTileState extends State<DismissibleListTile> {
  double dragExtent = 0.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Consumer<LocalStorage>(
      builder: (context, value, child) => Dismissible(
        key: Key('dismissible_item${widget.id}'),
        background: Builder(
          builder: (context) {
            double progress = (dragExtent / width) / 2;

            return Container(
              color: Theme.of(context).colorScheme.onError,
              child: Align(
                alignment: Alignment(1 - (progress * 2), 0),
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30,
                ),
              ),
            );
          },
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async {
          value.delete(widget.id);
          return false;
        },
        onUpdate: (details) {
          setState(() {
            dragExtent = details.progress * width;
          });
        },
        child: widget.child,
      ),
    );
  }
}
