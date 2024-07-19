import 'package:books_app/core/util/styles.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_card_item.dart';
import 'package:flutter/material.dart';

class BookDetailSection extends StatelessWidget {
  const BookDetailSection({
    super.key,
    required this.item,
  });
  final BookModel item;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const BookDetailsAppBar(),
        const SizedBox(
          height: 33.2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.20),
          child: BookCardItem(
            imageUrl: item.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(
          item.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          item.volumeInfo.authors?[0] ?? "Unknown",
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(
            color: const Color(0xffFFFFFF).withOpacity(0.7),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        BookRate(
          numberOfReviewrs: (item.volumeInfo.ratingsCount) ?? 0,
          rate: item.volumeInfo.averageRating ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37.0,
        ),
        BookAction(
          item: item,
        ),
      ],
    );
  }
}
