import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockify/core/other/debouncer.dart';
import 'package:stockify/features/presentation/provider/api_data.dart';
import 'package:stockify/features/presentation/widgets/custom_listtile.dart';
import 'package:stockify/features/presentation/widgets/custom_textfrom_field.dart';
import 'package:stockify/features/presentation/widgets/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controller = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    controller.addListener(
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(gap: 20),
            _searchField(context),
            controller.text.isEmpty
                ? _centerText('No data available for today')
                : _consumerBuilder(context)
          ],
        ),
      ),
    );
  }

  Consumer<ApiData> _consumerBuilder(BuildContext context) {
    return Consumer<ApiData>(
      builder: (context, value, child) {
        if (value.isLoading) {
          //--------loading state ----------------
          return Expanded(
              child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ));
        } else {
          //----------no data state----------------
          if (value.list.isEmpty) {
            return _centerText(
                'No results found for your search. Please try again with different keywords.');
          } else {
            //----------completed state or data state------------
            return Expanded(
                child: ListView.builder(
              itemCount: value.list.length,
              itemBuilder: (context, index) {
                final data = value.list[index];
                return CustomListtile(
                  title: data.the2Name ?? 'null',
                  subtitle: " ${data.the1Symbol}",
                  currency: data.the8Currency,
                  isIcon: true,
                );
              },
            ));
          }
        }
      },
    );
  }

  CustomTextfromField _searchField(BuildContext context) {
    return CustomTextfromField(
      controller: controller,
      onChanged: (value) {
        _debouncer.run(
          () => context.read<ApiData>().search(value),
        );
      },
    );
  }

  Expanded _centerText(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
