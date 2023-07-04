class ExceptionHelper implements Exception {
  final String message;

  ExceptionHelper({required this.message});
  @override
  String toString() {
    return message;
  }
}
