import 'package:books_app/core/util/styles.dart';
import 'package:books_app/features/home/presentation/views/widgets/recommanded_books_list_view.dart';
import 'package:flutter/material.dart';

class RecommandedBooksSection extends StatelessWidget {
  const RecommandedBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const RecommandedBooksListView(),
      ],
    );
  }
}
