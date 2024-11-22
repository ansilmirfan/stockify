import 'package:flutter/material.dart';
import 'package:stockify/features/presentation/widgets/custom_textfrom_field.dart';
import 'package:stockify/features/presentation/widgets/gap.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(gap: 20),
          CustomTextfromField(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
