import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  DateTime startDate = DateTime.now();
  DateTime finishDate = DateTime.now();

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay finishTime = TimeOfDay.now();

  void book() {
    emit(BookLoading());
    Future.delayed(Duration(milliseconds: 1000), () {
      emit(BookSucces());
    });
  }

  void pickStartDate(DateTime selectedstartDate) {
    emit(BookLoading());
    startDate = selectedstartDate;
    emit(BookInitial());
  }

  void pickFinishDate( DateTime selectedfinishDate) {
    emit(BookLoading());
    finishDate = selectedfinishDate;
    emit(BookInitial());
  }

  void pickStartTime( TimeOfDay selectedstartTime) {
    emit(BookLoading());
    startTime = selectedstartTime;
    emit(BookInitial());
  }

  void pickFinishTime(TimeOfDay selectedfinishTime) {
     emit(BookLoading());
    finishTime = selectedfinishTime;
    emit(BookInitial());
  }
}
