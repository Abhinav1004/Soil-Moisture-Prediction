abstract class BaseException implements Exception {
  String message;
  String? prefix;
  BaseException(this.message, [this.prefix]);

  @override
  String toString() => "$prefix: $message";
}

class DataFetchingException extends BaseException{
  DataFetchingException(String message):super(
    message,
    "Data Fetching Exception"
  );
}

class MachineLearningRelException extends BaseException{
  MachineLearningRelException(String message):super(
    message,
    "Machine learning relative exception"
  );
}
