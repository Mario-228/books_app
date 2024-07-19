import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/loading_indiactor_widget.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:books_app/features/home/presentation/views_models/newest_cubit/newest_book_cubit.dart';
import 'package:books_app/features/home/presentation/views_models/newest_cubit/newest_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBooksStates>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20.0,
            ),
            itemBuilder: (context, index) => BookItem(
              item: state.books[index],
            ),
          );
        } else if (state is NewestBooksErrorState) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
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
