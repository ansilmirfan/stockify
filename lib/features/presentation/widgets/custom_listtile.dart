import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockify/features/data/model/watch_list_model.dart';
import 'package:stockify/features/presentation/provider/local_storage.dart';
import 'package:stockify/features/presentation/themes/styles.dart';
import 'package:stockify/features/presentation/widgets/dismissible_listtile.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isIcon;
  final int? id;
  final int maxline;
  final String? currency;
  final String? trailingTitle;
  final String? trailingSubtitle;
  final bool dismissible;
  const CustomListtile(
      {super.key,
      this.id,
      required this.title,
      required this.subtitle,
      this.isIcon = false,
      this.maxline = 2,
      this.trailingSubtitle,
      this.dismissible = false,
      this.currency,
      this.trailingTitle});

  @override
  Widget build(BuildContext context) {
    if (dismissible) {
      return DismissibleListTile(
        id: id!,
        child: _listtile(context),
      );
    } else {
      return _listtile(context);
    }
  }

  Padding _listtile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        child: Material(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                _leading(context),
                isIcon ? _trailingIcon() : _trailingText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _trailingText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          trailingTitle!,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        Text(
          trailingSubtitle!,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.onError),
        ),
      ],
    );
  }

  Widget _trailingIcon() {
    return Consumer<LocalStorage>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          //------checking for the item is already in the database--------
          final result = value.contains(subtitle);
          if (!result) {
            value.add(WatchListModel(
                symbol: subtitle, companyName: title, currency: currency!));
          } else {}
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: Styles.gradiantStyle,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5),
              //------if  the company is already in the local storage
              //-------then check mark otherwise add icon--------
              child: AnimatedSwitcher(
                duration: const Duration(microseconds: 200),
                child: value.contains(subtitle)
                    ? const Icon(Icons.check)
                    : const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _leading(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: maxline,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
        ],
      ),
    );
  }
}
