import 'package:books_app/features/home/data/models/book_model/book_model.dart';

abstract class NewestBooksStates {
  const NewestBooksStates();
}

class NewestBooksInitialState extends NewestBooksStates {}

class NewestBooksLoadingState extends NewestBooksStates {}

class NewestBooksErrorState extends NewestBooksStates {
  final String errorMessage;

  const NewestBooksErrorState(this.errorMessage);
}

class NewestBooksSuccessState extends NewestBooksStates {
  final List<BookModel> books;

  const NewestBooksSuccessState(this.books);
}
