import 'package:books_app/constants.dart';
import 'package:books_app/core/util/app_router.dart';
import 'package:books_app/core/util/service_locator.dart';
import 'package:books_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:books_app/features/home/presentation/views_models/all_books_cubit/all_books_cubit.dart';
import 'package:books_app/features/home/presentation/views_models/newest_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..getAllBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit(
            getIt.get<HomeRepoImplementation>(),
          )..getNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: kPrimaryColor, brightness: Brightness.dark),
          useMaterial3: true,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ).copyWith(scaffoldBackgroundColor: kPrimaryColor),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
