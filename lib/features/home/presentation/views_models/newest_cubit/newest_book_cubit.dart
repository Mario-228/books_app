import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentation/views_models/newest_cubit/newest_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBooksStates> {
  NewestBookCubit(this.homeRepo) : super(NewestBooksInitialState());
  final HomeRepo homeRepo;

  static NewestBookCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (error) => emit(NewestBooksErrorState(error.errorMessage)),
      (value) => emit(NewestBooksSuccessState(value)),
    );
  }
}
