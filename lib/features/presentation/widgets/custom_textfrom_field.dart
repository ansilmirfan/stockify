import 'package:flutter/material.dart';


class CustomTextfromField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const CustomTextfromField(
      {super.key, required this.controller, required this.onChanged});
 

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
          onChanged:onChanged,
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
