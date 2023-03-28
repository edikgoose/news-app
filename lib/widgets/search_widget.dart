import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  void _searchPressed() {
    print("search");
  }

  void _settginsPressed() {
    print("settings pressed");
  }

  @override
  Widget build(BuildContext context) {
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
