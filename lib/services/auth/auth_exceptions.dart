// login exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register exceptions
class InvalidEmailAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidCredentialsAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

// generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
