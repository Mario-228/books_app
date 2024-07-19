import 'package:books_app/features/search/presentation/views_model/search_cubit.dart/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return TextField(
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          SearchCubit.get(context).getSearchedBooks(bookName: value);
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          SearchCubit.get(context).getSearchedBooks(bookName: value);
        }
      },
      controller: search,
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            if (search.text.isNotEmpty) {
              SearchCubit.get(context).getSearchedBooks(bookName: search.text);
            }
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22.0,
          ),
        ),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12.0),
    );
  }
}
