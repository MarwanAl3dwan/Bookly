import 'package:bookly/core/utils/app_bloc_observer.dart';
import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/core/utils/colors_manager.dart';
import 'package:bookly/core/utils/di.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/cubits/featured_books_cubit%20copy/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/app_router.dart';
import 'features/home/domain/usecases/fetch_featured_books_use_case.dart';

void main() async {
  await initAppModule();
  await initHive();
  Bloc.observer = AppBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(instance<FetchFeaturedBooksUseCase>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(instance<FetchNewestBooksUseCase>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsManager.primary,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        // themeMode: ThemeMode.dark,
      ),
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(ConstantsManager.featuredBooksBox);
  await Hive.openBox<BookEntity>(ConstantsManager.newestBooksBox);
}
