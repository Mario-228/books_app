import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/loading_indiactor_widget.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_card_item.dart';
import 'package:books_app/features/home/presentation/views_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_app/features/home/presentation/views_models/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommandedBooksListView extends StatelessWidget {
  const RecommandedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: BookCardItem(
                  imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,
                  //?? "https://img.freepik.com/free-photo/book-composition-with-open-book_23-2147690555.jpg?w=996&t=st=1721153032~exp=1721153632~hmac=6d7ca7b2245ea2adfa4cc65bd1f4aad8a1f6032eab76f613d8a9efee7ac94a99"
                ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const LoadingIndiactorWidget();
        }
      },
    );
  }
}
