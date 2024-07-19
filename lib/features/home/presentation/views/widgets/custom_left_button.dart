import 'package:books_app/core/util/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonLeftRounded extends StatelessWidget {
  const CustomButtonLeftRounded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xffFFFFFF),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(15.0),
              bottomStart: Radius.circular(15.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Free",
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
