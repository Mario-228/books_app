import 'package:books_app/core/util/styles.dart';
import 'package:flutter/material.dart';

class ErrorLoadingImage extends StatelessWidget {
  const ErrorLoadingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.priority_high,
          size: 35.0,
        ),
        Text(
          "Failed to load image please try again ...",
          style: Styles.textStyle18,
        )
      ],
    );
  }
}
