import 'package:books_app/core/errors/errors.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Errors, List<BookModel>>> searchBooks(
      {required String bookName});
}
