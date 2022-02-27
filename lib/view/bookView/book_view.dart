import 'package:flutter/material.dart';
import 'package:luggage_storage/product/widgets/book_now_widget.dart';

buildBookingSheet(
    {required BuildContext context,
    required DateTime dateTime,
    required TimeOfDay? time}) async {
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
      return SizedBox(
        height: 450,
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
                          "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                          style: const TextStyle(fontSize: 23),
                        ),
                      ],
                    ),
                    onTap: () async {
                      DateTime? _newDate = await showDatePicker(
                        context: context,
                        initialDate: dateTime,
                        firstDate: DateTime(1800),
                        lastDate: DateTime(3000),
                      );
                      if (_newDate != null) {}
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
                          "${time!.hour.toString()}:${time.minute.toString()}",
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
                          "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                          style: const TextStyle(fontSize: 23),
                        ),
                        onTap: () async {
                          DateTime? _newDate = await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            firstDate: DateTime(1800),
                            lastDate: DateTime(3000),
                          );
                          if (_newDate != null) {}
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
                          "${time.hour.toString()}:${time.minute.toString()}",
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
              SizedBox(
                height: 30,
              ),
              Text("Luggage"),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                child: BookNow(
                  // ignore: void_checks
                  function: () {
                    buildBookingSheet(
                      context: context,
                      dateTime: DateTime.now(),
                      time: TimeOfDay.now(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
