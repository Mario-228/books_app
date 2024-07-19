import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentation/views_models/all_books_cubit/all_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksCubit extends Cubit<AllBooksStates> {
  AllBooksCubit(this.homeRepo) : super(AllBooksInitialState());
  final HomeRepo homeRepo;

  static AllBooksCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllBooks() async {
    emit(AllBooksLoadingState());
    var result = await homeRepo.fetchAllBooks();
    result.fold(
      (error) => emit(AllBooksErrorState(error.errorMessage)),
      (value) => emit(AllBooksSuccessState(value)),
    );
  }
}
