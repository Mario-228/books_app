import 'package:books_app/core/util/styles.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/card_book_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: CustomAppBar(),
                ),
                CardBookListView(),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
        //if we used =>SliverToBoxAdapter ..then we must make the listview to be shrinkWrap to get the total height ....
        //if we used =>SliverFillRemaining ..then don't have to get the total height of the listview beacuse the (SliverFillRemaining)=Expanded...more efficient solution.
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
