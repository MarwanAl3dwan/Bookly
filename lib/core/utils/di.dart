import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories_impl/home_repository_impl.dart';
import 'package:bookly/features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerSingleton<Dio>(Dio());

  instance.registerSingleton<ApiService>(ApiService(instance<Dio>()));

  instance.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(instance<ApiService>()),
  );

  instance
      .registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());

  instance.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(
    homeRemoteDataSource: instance<HomeRemoteDataSourceImpl>(),
    homeLocalDataSource: instance<HomeLocalDataSourceImpl>(),
  ));

  instance.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(instance<HomeRepositoryImpl>()),
  );

  instance.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(instance<HomeRepositoryImpl>()),
  );
}
