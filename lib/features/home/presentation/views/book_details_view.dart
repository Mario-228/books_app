import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:books_app/features/home/presentation/views_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.item});
  final BookModel item;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SimilarBooksCubit.get(context)
          .getSimilarBooks(category: item.volumeInfo.categories![0]);
      return Scaffold(
        body: SafeArea(
          child: BookDetailsViewBody(item: item),
        ),
      );
    });
  }
}
