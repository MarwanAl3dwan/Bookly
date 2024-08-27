import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/book_entity.dart';
import '../repositories/home_repository.dart';

class FetchNewestBooksUseCase extends BaseUseCase<int, List<BookEntity>> {
  final HomeRepository homeRepository;

  FetchNewestBooksUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> execute([int param = 0]) async {
    return await homeRepository.fetchNewestBooks(pageNumber: param);
  }
}
