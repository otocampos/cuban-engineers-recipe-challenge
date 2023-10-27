
import 'package:dartz/dartz.dart';

import '../../networking/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
