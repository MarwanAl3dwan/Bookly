import 'package:hive/hive.dart';

import '../../features/home/domain/entities/book_entity.dart';

void cacheBooksToLocalDataSource(List<BookEntity> booksList, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(booksList);
}
