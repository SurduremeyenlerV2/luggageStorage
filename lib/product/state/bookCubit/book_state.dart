part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}
class BookLoading extends BookState {}
class BookSucces extends BookState {}
class BookFailed extends BookState {}
