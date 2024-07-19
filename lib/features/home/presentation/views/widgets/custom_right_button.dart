import 'package:books_app/core/util/styles.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButtonRightRounded extends StatelessWidget {
  const CustomButtonRightRounded({
    super.key,
    required this.item,
  });
  final BookModel item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xffEF8262),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15.0),
              bottomEnd: Radius.circular(15.0),
            ),
          ),
        ),
        onPressed: () async {
          Uri url = Uri.parse(item.volumeInfo.previewLink!);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        child: Text(
          "Free preview",
          textAlign: TextAlign.center,
          style: Styles.textStyle16.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
