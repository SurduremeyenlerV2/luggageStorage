import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:luggage_storage/product/state/bookCubit/book_cubit.dart';

  Positioned bookNowWidget(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            context.read<BookCubit>().book();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.cyan),
            height: 60,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'BOOK NOW',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      bottom: 0,
      left: 0,
      right: 0,
    );
  }
buildBookingSheet({required BuildContext context}) async {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    // isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => BookCubit(),
        child: BlocConsumer<BookCubit, BookState>(
          listener: (context, state) {
            if (state is BookSucces) {
              AutoRouter.of(context).push(const BookSuccesView());
            }
          },
          builder: (context, state) {
            var cubit = context.read<BookCubit>();
            return SizedBox(
              height: 370,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text("Drop-Off"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Row(
                                children: [
                                  Icon(Icons.date_range),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${cubit.startDate.day}-${cubit.startDate.month}-${cubit.startDate.year}",
                                    style: const TextStyle(fontSize: 23),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                DateTime? _newDate = await showDatePicker(
                                  context: context,
                                  initialDate: cubit.startDate,
                                  firstDate: DateTime(1800),
                                  lastDate: DateTime(3000),
                                );
                                if (_newDate != null) {
                                  cubit.pickStartDate(_newDate);
                                }
                              },
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Icon(Icons.access_time_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${cubit.startTime.hour.toString()}:${cubit.startTime.minute.toString()}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                    context: context, initialTime: TimeOfDay.now());
                                if (newTime != null) {}
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("Pick Up"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.date_range),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  child: Text(
                                    "${cubit.finishDate.day}-${cubit.finishDate.month}-${cubit.finishDate.year}",
                                    style: const TextStyle(fontSize: 23),
                                  ),
                                  onTap: () async {
                                    DateTime? _newDate = await showDatePicker(
                                      context: context,
                                      initialDate: cubit.finishDate,
                                      firstDate: DateTime(1800),
                                      lastDate: DateTime(3000),
                                    );
                                    if (_newDate != null) {
                                      cubit.pickFinishDate(_newDate);
                                    }
                                  },
                                ),
                              ],
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Icon(Icons.access_time_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${cubit.finishTime.hour.toString()}:${cubit.finishTime.minute.toString()}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: cubit.finishTime);
                                if (newTime != null) {
                                  cubit.pickFinishTime(newTime);
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          child: bookNowWidget(context),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
