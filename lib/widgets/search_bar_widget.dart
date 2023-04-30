import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../news_model/category.dart';
import '../news_model/request.dart';

typedef SearchCallback = void Function(Request request);
typedef SettingsCallback = void Function();
typedef SetCategoryCallback = void Function(SearchCategory category);


class SearchBarWidget extends ConsumerStatefulWidget {
  final SearchCallback searchRequestCallback;

  const SearchBarWidget({required this.searchRequestCallback, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsumerSearchBarState();
}

class _ConsumerSearchBarState extends ConsumerState<SearchBarWidget> {
  String _content = "";
  SearchCategory _category = SearchCategory.general;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      hintText: "Search News"),
                  style: const TextStyle(fontSize: 12),
                  onChanged: (value) {
                    setState(() {
                      _content = value;
                    });
                  },
                  onSubmitted: (value) {
                    widget.searchRequestCallback(Request(null, _content, _category));
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    widget.searchRequestCallback(Request(null, _content, _category));
                  },
                  icon: const Icon(Icons.search_sharp)),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: () {
                  _showCategoryChoiceDialog((category) {
                    _category = category;
                    widget.searchRequestCallback(Request(null, _content, _category));
                  });
                },
                icon: const Icon(Icons.settings_outlined),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCategoryChoiceDialog(SetCategoryCallback setCategoryCallback) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog( // <-- SEE HERE
            title: const Text('Select category'),
            children: SearchCategory.values.map((category) => SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setCategoryCallback(category);
              },
              child: Text(category.name),
            )).toList()
          );
        });
  }
}
