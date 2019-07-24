import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MoviesListEvent extends Equatable {
  MoviesListEvent([List props = const []]) : super(props);
}

class Fetch extends MoviesListEvent {
  @override
  String toString() {
    return 'Fetch';
  }
}
