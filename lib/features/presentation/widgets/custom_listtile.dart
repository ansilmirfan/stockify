import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/themes/styles.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isIcon;
  final String? trailingTitle;
  final String? trailingSubtitle;
  const CustomListtile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.isIcon = false,
      this.trailingSubtitle,
      this.trailingTitle});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return false;
      },
      background: Container(
        color: Colors.red,
      ),
      child: Padding(
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
      ),
    );
  }

  Expanded _trailingText(BuildContext context) {
    return Expanded(
      child: Column(
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
      ),
    );
  }

  Widget _trailingIcon() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: Styles.gradiantStyle,
        child: const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.add),
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
