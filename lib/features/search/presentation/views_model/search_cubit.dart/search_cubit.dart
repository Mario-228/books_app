import 'package:books_app/features/search/data/repos/search_repo.dart';
import 'package:books_app/features/search/presentation/views_model/search_cubit.dart/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());
  static SearchCubit get(BuildContext context) => BlocProvider.of(context);
  final SearchRepo searchRepo;

  Future<void> getSearchedBooks({required String bookName}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.searchBooks(bookName: bookName);
    result.fold(
      (error) => emit(SearchErrorState(errorMessage: error.errorMessage)),
      (value) => emit(SearchSuccessState(books: value)),
    );
  }
}
