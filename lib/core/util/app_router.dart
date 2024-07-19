import 'package:books_app/core/util/service_locator.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:books_app/features/home/presentation/views/book_details_view.dart';
import 'package:books_app/features/home/presentation/views/home_view.dart';
import 'package:books_app/features/home/presentation/views_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:books_app/features/search/presentation/views/search_view.dart';
import 'package:books_app/features/search/presentation/views_model/search_cubit.dart/search_cubit.dart';
import 'package:books_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = "/HomeView";
  static const String kBookDetailsView = "/BookDetailsView";
  static const String kSearchView = "/SearchView";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          ),
          child: BookDetailsView(
            item: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<SearchRepoImplementation>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
