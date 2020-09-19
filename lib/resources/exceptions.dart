class ExccptionError implements Exception {
  final String message;
  ExccptionError(this.message);
  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
