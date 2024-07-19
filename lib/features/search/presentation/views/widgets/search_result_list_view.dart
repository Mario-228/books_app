import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/loading_indiactor_widget.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:books_app/features/search/presentation/views_model/search_cubit.dart/search_cubit.dart';
import 'package:books_app/features/search/presentation/views_model/search_cubit.dart/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          if (state.books.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemBuilder: (context, index) => BookItem(
                item: state.books[index],
              ),
            );
          } else {
            return const Center(
              child: Text("No Data"),
            );
          }
        } else if (state is SearchErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const LoadingIndiactorWidget();
        }
      },
    );
  }
}
