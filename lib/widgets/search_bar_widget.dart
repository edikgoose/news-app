import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../news_model/category.dart';
import '../news_model/request.dart';

typedef SearchCallback = void Function(SearchParameters request);
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
  String _content = '';
  SearchCategory _category = SearchCategory.none;
  @override
  Widget build(BuildContext context) {
     final searchCategoriesLocales = {
      'business': AppLocalizations.of(context)!.business,
      'entertainment': AppLocalizations.of(context)!.entertainment,
      'general': AppLocalizations.of(context)!.general,
    'health': AppLocalizations.of(context)!.health,
    'science': AppLocalizations.of(context)!.science,
    'sports': AppLocalizations.of(context)!.sports,
    'technology': AppLocalizations.of(context)!.technology,
    'sources': AppLocalizations.of(context)!.sources,
    'none': AppLocalizations.of(context)!.none,
     };
    
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
                  decoration:  InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.searchNews,),
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
                  _showCategoryChoiceDialog((category) {
                    _category = category;
                    widget.searchRequestCallback(SearchParameters(null, _content, _category));
                  }, searchCategoriesLocales);
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

  Future<void> _showCategoryChoiceDialog(SetCategoryCallback setCategoryCallback, Map<String, String> map) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog( // <-- SEE HERE
            title: Text(AppLocalizations.of(context)!.selectCategory),
            children: SearchCategory.values.map((category) => SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setCategoryCallback(category);
              },
              child: Text(map[category.name]!),
            )).toList()
          );
        });
  }
}
