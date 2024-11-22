import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 60,
              child: InkWell(
                splashColor:
                    Theme.of(context).colorScheme.onPrimary.withAlpha(5),
                borderRadius: BorderRadius.circular(10),
                splashFactory: InkSplash.splashFactory,
                onTap: () {},
                child: Ink(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Theme.of(context).colorScheme.onPrimary,
                          offset: const Offset(2, 2),
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'some titlte',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              'some subtitile',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer),
                            ),
                          ],
                        )),
                        const Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Text('data'), Text('data')],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
