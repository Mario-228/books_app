import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentation/views_models/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitialState());
  final HomeRepo homeRepo;
  static SimilarBooksCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (error) => emit(SimilarBooksErrorState(errorMessage: error.errorMessage)),
      (value) => emit(SimilarBooksSuccessState(books: value)),
    );
  }
}
