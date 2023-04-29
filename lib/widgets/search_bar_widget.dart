import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SearchCallback = void Function(String searchText);
typedef SettingsCallback = void Function();

class SearchBarWidget extends ConsumerStatefulWidget {
  final SearchCallback searchRequestCallback;
  final SettingsCallback settingsOpenCallback;

  const SearchBarWidget({required this.searchRequestCallback, required this.settingsOpenCallback,
      super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsumerSearchBarState();
}

class _ConsumerSearchBarState extends ConsumerState<SearchBarWidget> {
  String _content = "";

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
                    widget.searchRequestCallback(value);
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
                    widget.searchRequestCallback(_content);
                  },
                  icon: const Icon(Icons.search_sharp)),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: () {
                  widget.settingsOpenCallback();
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
}
