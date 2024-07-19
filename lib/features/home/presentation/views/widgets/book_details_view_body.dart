import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_detail_section.dart';
import 'package:books_app/features/home/presentation/views/widgets/recommanded_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.item});
  final BookModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                BookDetailSection(
                  item: item,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50.0,
                  ),
                ),
                const RecommandedBooksSection(),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
