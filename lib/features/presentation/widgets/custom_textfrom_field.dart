import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockify/features/presentation/provider/api_data.dart';

class CustomTextfromField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextfromField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            context.read<ApiData>().search(value);
          },
          cursorColor: Theme.of(context).colorScheme.onPrimary,
          decoration: InputDecoration(
            labelText: 'Search..',
            hintText: 'Type something here...',
            prefixIcon: const Icon(Icons.search),
            floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
      ),
    );
  }
}
