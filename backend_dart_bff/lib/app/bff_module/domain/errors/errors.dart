// ignore_for_file: overridden_fields

abstract class IBffFailure implements Exception {
  final String? message;
  IBffFailure({this.message});
}

class NullOrEmptyTypeIdError extends IBffFailure {
  @override
  final String? message;
  NullOrEmptyTypeIdError({this.message});
}

class SaveLocalBff extends IBffFailure {
  @override
  final String? message;
  SaveLocalBff({this.message});
}

class MapperBffError extends IBffFailure {
  @override
  final String? message;
  MapperBffError({this.message});
}

class NotValidCodeParam extends IBffFailure {
  @override
  final String? message;
  NotValidCodeParam({this.message});

  @override
  String toString() => 'RegisterActivityError(message: $message)';
}

class DomainError extends IBffFailure {
  @override
  final String? message;
  DomainError({this.message});

  @override
  String toString() => 'DomainError(message: $message)';
}

class DeleteActivityError extends IBffFailure {
  @override
  final String? message;
  DeleteActivityError({this.message});

  @override
  String toString() => 'RegisterActivityError(message: $message)';
}

class BffTypeError extends IBffFailure {
  @override
  final String? message;
  BffTypeError({this.message});

  @override
  String toString() => 'BffTypeError(message: $message)';
}
