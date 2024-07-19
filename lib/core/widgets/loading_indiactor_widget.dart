import 'package:flutter/material.dart';

class LoadingIndiactorWidget extends StatelessWidget {
  const LoadingIndiactorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
