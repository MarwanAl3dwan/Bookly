import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input param);
}
