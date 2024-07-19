import 'package:books_app/core/errors/errors.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Errors, List<BookModel>>> fetchNewestBooks();
  Future<Either<Errors, List<BookModel>>> fetchAllBooks();
  Future<Either<Errors, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
