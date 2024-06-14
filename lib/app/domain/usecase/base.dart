import 'package:equatable/equatable.dart';

abstract class BaseParams extends Equatable {}

class NoParams extends BaseParams {
  @override
  List<Object> get props => <Object>[];
}

abstract class BaseUseCase<T, P> {
  Future<T> call(P params);
}
