import 'package:books_app/core/util/app_router.dart';
import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/loading_indiactor_widget.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_card_item.dart';
import 'package:books_app/features/home/presentation/views_models/all_books_cubit/all_books_cubit.dart';
import 'package:books_app/features/home/presentation/views_models/all_books_cubit/all_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardBookListView extends StatelessWidget {
  const CardBookListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit, AllBooksStates>(
      builder: (context, state) {
        if (state is AllBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index]),
                  child: BookCardItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is AllBooksErrorState) {
          return Column(
            children: [
              CustomErrorWidget(errorMessage: state.errorMessage),
            ],
          );
        } else {
          return const LoadingIndiactorWidget();
        }
      },
    );
  }
}
