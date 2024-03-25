abstract class Failure {
  final String message;

  Failure({required this.message});
}

class CachedFailure extends Failure {
  CachedFailure({
    required String message,
  }) : super(
          message: message,
        );
}
