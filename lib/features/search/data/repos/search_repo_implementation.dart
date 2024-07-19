import 'package:books_app/core/errors/errors.dart';
import 'package:books_app/core/util/api_services.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiServices api;

  SearchRepoImplementation({required this.api});
  @override
  Future<Either<Errors, List<BookModel>>> searchBooks(
      {required String bookName}) async {
    try {
      var value = await api.get(
          endPoint: "volumes?q=subject:$bookName&Filtering=free-ebooks");
      List<BookModel> books = [];
      for (var element in value["items"]) {
        try {
          books.add(BookModel.fromJson(element));
        } catch (e) {
          //To add only the books without null values
        }
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
