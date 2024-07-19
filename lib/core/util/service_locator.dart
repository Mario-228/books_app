import 'package:books_app/core/util/api_services.dart';
import 'package:books_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:books_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      api: getIt.get<ApiServices>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(
      api: getIt.get<ApiServices>(),
    ),
  );
}
