import 'package:books_app/features/home/data/models/book_model/book_model.dart';

abstract class SearchStates {
  const SearchStates();
}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<BookModel> books;

  const SearchSuccessState({required this.books});
}

class SearchErrorState extends SearchStates {
  final String errorMessage;

  const SearchErrorState({required this.errorMessage});
}
