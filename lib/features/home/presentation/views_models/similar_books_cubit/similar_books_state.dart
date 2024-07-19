import 'package:books_app/features/home/data/models/book_model/book_model.dart';

abstract class SimilarBooksState {
  const SimilarBooksState();
}

class SimilarBooksInitialState extends SimilarBooksState {}

class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccessState({required this.books});
}

class SimilarBooksErrorState extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksErrorState({required this.errorMessage});
}
