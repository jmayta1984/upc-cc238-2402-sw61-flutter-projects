import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_service.dart';
import 'package:rick_and_morty/features/characters/presentation/widget/character_list_item.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final PagingController<int, CharacterModel> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> _fetchPage(int page) async {
    try {
      List<CharacterModel> newCharacters =
          await CharacterService().getCharacters(page);
      final bool isLastPage = newCharacters.length < AppConstants.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newCharacters);
      } else {
        _pagingController.appendPage(newCharacters, page + 1);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener(
      (page) {
        _fetchPage(page);
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, CharacterModel>(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return CharacterListItem(
            character: item,
          );
        },
      ),
    );
  }
}
