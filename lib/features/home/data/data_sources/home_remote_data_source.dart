import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

import '../../../../core/utils/functions.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;
  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    final data = await _apiService.get(
      endPoint: 'volumes?q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> booksList = _getBooksList(data);
    cacheBooksToLocalDataSource(booksList, ConstantsManager.featuredBooksBox);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    int page = pageNumber + 2;
    final data = await _apiService.get(
      endPoint: 'volumes?sorting=newest&q=programming&startIndex=${page * 10}',
    );
    List<BookEntity> booksList = _getBooksList(data);
    cacheBooksToLocalDataSource(booksList, ConstantsManager.newestBooksBox);
    return booksList;
  }

  List<BookEntity> _getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
