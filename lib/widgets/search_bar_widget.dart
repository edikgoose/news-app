import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../news_model/category.dart';
import '../news_model/request.dart';
import '../news_model/countries.dart';

typedef SearchCallback = void Function(SearchParameters request);
typedef SettingsCallback = void Function();
typedef SetCategoryCallback = void Function(SearchCategory category);
typedef SetSearchSettingsCallback = void Function(SearchParameters settings);

class SearchBarWidget extends ConsumerStatefulWidget {
  final SearchCallback searchRequestCallback;

  const SearchBarWidget({required this.searchRequestCallback, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsumerSearchBarState();
}

class _ConsumerSearchBarState extends ConsumerState<SearchBarWidget> {
  String _content = '';
  SearchCategory _category = SearchCategory.none;
  Country? _country;
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
                      hintText: 'Search News'),
                  style: const TextStyle(fontSize: 12),
                  onChanged: (value) {
                    setState(() {
                      _content = value;
                    });
                  },
                  onSubmitted: (value) {
                    widget.searchRequestCallback(SearchParameters(null, _content, _category));
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
                    widget.searchRequestCallback(SearchParameters(null, _content, _category));
                  },
                  icon: const Icon(Icons.search_sharp)),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: () {
                  _showSearchSettingsDialog((settings) {
                    _category = settings.category!;
                    _country = settings.country;
                    _content = settings.query;
                    widget.searchRequestCallback(SearchParameters(_country, _content, _category));
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

  // need to write a function that will show a dialog with a list of categories and language
  // and will return a SearchParameters object
  Future<void> _showSearchSettingsDialog(SetSearchSettingsCallback setSearchSettingsCallback) async {
    SearchCategory selectedCategory = _category;
    Country? selectedCountry = _country;
    String content = _content;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Select category and language',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'Category',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        ...SearchCategory.values.map((category) => RadioListTile(
                          title: Text(category.name),
                          value: category,
                          groupValue: selectedCategory,
                          onChanged: (SearchCategory? value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                        )).toList(),
                        const SizedBox(height: 16),
                        Text(
                          'Language',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        ...Country.values.map((language) => RadioListTile(
                          title: Text(language.name),
                          value: language,
                          groupValue: selectedCountry,
                          onChanged: (Country? value) {
                            setState(() {
                              selectedCountry = value!;
                            });
                          },
                        )).toList(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setSearchSettingsCallback(SearchParameters(selectedCountry, content, selectedCategory));
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
