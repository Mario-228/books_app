import 'package:books_app/features/home/data/models/book_model/book_model.dart';

abstract class AllBooksStates {
  const AllBooksStates();
}

class AllBooksInitialState extends AllBooksStates {}

class AllBooksLoadingState extends AllBooksStates {}

class AllBooksErrorState extends AllBooksStates {
  final String errorMessage;

  const AllBooksErrorState(this.errorMessage);
}

class AllBooksSuccessState extends AllBooksStates {
  final List<BookModel> books;

  const AllBooksSuccessState(this.books);
}
