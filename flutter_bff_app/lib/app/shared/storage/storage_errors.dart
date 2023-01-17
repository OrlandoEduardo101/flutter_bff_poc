abstract class FailureStorage implements Exception {
  final String? message;

  FailureStorage(this.message);
}

class DeleteError implements FailureStorage {
  @override
  final String? message;
  DeleteError({this.message});
}

class PutError implements FailureStorage {
  @override
  final String? message;
  PutError({this.message});
}

class UpdateError implements FailureStorage {
  @override
  final String? message;
  UpdateError({this.message});
}

class ReadError implements FailureStorage {
  @override
  final String? message;
  ReadError({this.message});
}