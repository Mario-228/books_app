import 'package:books_app/core/util/styles.dart';
import 'package:books_app/features/search/presentation/views/widgets/custom_search_field.dart';
import 'package:books_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchField(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SearchResultListView(),
          )
        ],
      ),
    );
  }
}
