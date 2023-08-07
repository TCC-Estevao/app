abstract class AppExceptions {
  final String message;
  final String? stackTracer;

  AppExceptions(this.message, [this.stackTracer]);

  @override
  String toString() {
    var traceText = '';
    if (stackTracer != null) {
      traceText = '\n$stackTracer';
    }
    return '$runtimeType : $message';
  }
}
