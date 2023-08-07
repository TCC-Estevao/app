import 'package:app/exceptions/exception.dart';
import 'package:asp/asp.dart';

final globalLoaderState = Atom(false);
final globalExceptionState = Atom<AppExceptions?>(null);
