class ServerException implements Exception {}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}

class EmailAlreadyTakenException extends ServerException {}
class WrongCredentialException extends ServerException {}
