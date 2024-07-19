import 'package:books_app/constants.dart';
import 'package:books_app/core/util/app_router.dart';
import 'package:books_app/core/util/styles.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_card_item.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.item});
  final BookModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: item),
      child: SizedBox(
        height: 125.0,
        child: Row(
          children: [
            BookCardItem(imageUrl: item.volumeInfo.imageLinks.thumbnail),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      item.volumeInfo.title ?? "Connection Weak",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGTSectraFine),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    item.volumeInfo.authors![0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRate(
                        rate: item.volumeInfo.averageRating ?? 0,
                        numberOfReviewrs: item.volumeInfo.ratingsCount ?? 0,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
