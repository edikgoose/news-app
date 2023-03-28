import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  void _searchPressed() {
    print("search");
  }

  void _settginsPressed() {
    print("settings pressed");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: _searchPressed, icon: Icon(Icons.search)),
              TextField(
                controller: myController,
              ),
              IconButton(onPressed: _settginsPressed, icon: Icon(Icons.settings)),
            ],
          ),
        ],
      ),
    );
  }
}
