import 'package:books_app/core/errors/errors.dart';
import 'package:books_app/core/util/api_services.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices api;

  HomeRepoImplementation({required this.api});

  @override
  Future<Either<Errors, List<BookModel>>> fetchAllBooks() async {
    try {
      var value = await api.get(
          endPoint:
              "volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest");
      List<BookModel> books = [];
      for (var element in value["items"]) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Errors, List<BookModel>>> fetchNewestBooks() async {
    try {
      var value = await api.get(
          endPoint: "volumes?q=computer science&Filtering=free-ebooks");
      List<BookModel> books = [];
      for (var element in value["items"]) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Errors, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var value = await api.get(
          endPoint:
              "volumes?q=subject:$category&Filtering=free-ebooks&Sorting=relevance");
      List<BookModel> books = [];
      for (var element in value["items"]) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
