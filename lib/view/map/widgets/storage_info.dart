import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';

class StorageInfo extends StatelessWidget {
  const StorageInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AutoRouter.of(context).push(StorageDetailView());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 300,
        height: 150,
      ),
    );
  }
}

void storageInfo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Container();
    },
  );
}
