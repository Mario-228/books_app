import 'package:books_app/core/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  const BookRate(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rate,
      required this.numberOfReviewrs});
  final num rate;
  final int numberOfReviewrs;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14.0,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rate.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            "($numberOfReviewrs)",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
