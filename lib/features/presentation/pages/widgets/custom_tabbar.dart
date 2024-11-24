import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/widgets/gap.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TabBar(
        tabs: [
          _tabarItem(Icons.home, 'Home'),
          _tabarItem(Icons.bookmark, 'Watch List')
        ],
      ),
    );
  }

  Padding _tabarItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Gap.width(),
          Text(text),
        ],
      ),
    );
  }
}
