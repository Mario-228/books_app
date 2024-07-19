import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_left_button.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_right_button.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({
    super.key,
    required this.item,
  });
  final BookModel item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: CustomButtonLeftRounded()),
        if (item.volumeInfo.previewLink != null ||
            item.volumeInfo.previewLink!.isNotEmpty)
          Expanded(
              child: CustomButtonRightRounded(
            item: item,
          )),
      ],
    );
  }
}
