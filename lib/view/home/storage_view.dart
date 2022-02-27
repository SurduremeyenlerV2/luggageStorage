import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StorageDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          bookNowWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarWidget(size),
              const SizedBox(
                height: 15,
              ),
              hotelDestWidget(),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    'Luggage storage İstanbul Terminal',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ratingBar(),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '5\$ BAG/DAY',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              proportiesWidget(),
              const SizedBox(
                height: 45,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Location',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Esenler',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Positioned bookNowWidget() {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 104, 180, 241)),
            height: 60,
            child: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'BOOK NOW',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
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

  Column proportiesWidget() {
    return Column(
      children: [
        iconAndTextWidget(
            icon: const Icon(
              Icons.electric_bike,
              size: 18,
            ),
            text: '3 Min Fast Check In'),
        const SizedBox(
          height: 20,
        ),
        iconAndTextWidget(
            icon: const Icon(
              Icons.electric_bike,
              size: 18,
            ),
            text: '3 Min Fast Check In'),
        const SizedBox(
          height: 20,
        ),
        iconAndTextWidget(
            icon: const Icon(
              Icons.electric_bike,
              size: 18,
            ),
            text: '3 Min Fast Check In'),
        const SizedBox(
          height: 20,
        ),
        iconAndTextWidget(
            icon: const Icon(
              Icons.electric_bike,
              size: 18,
            ),
            text: '3 Min Fast Check In'),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Container iconAndTextWidget({required Icon icon, required String text}) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [icon, Text(text)],
      ),
    );
  }

  Padding ratingBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RatingBar.builder(
        wrapAlignment: WrapAlignment.start,
        itemSize: 20,
        initialRating: 4,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          size: 3,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }

  Container appBarWidget(Size size) {
    return Container(
      color: Color.fromARGB(255, 73, 151, 214),
      height: size.height * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(Icons.arrow_back)),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.publish),
          ),
        ],
      ),
    );
  }

  Padding hotelDestWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Opacity(
            opacity: 0.5,
            child: Row(
              children: const [
                Icon(
                  Icons.home,
                  size: 18,
                ),
                SizedBox(
                  width: 2,
                ),
                Text('Hotel'),
              ],
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Opacity(
            opacity: 0.5,
            child: Row(
              children: const [
                Icon(
                  Icons.home,
                  size: 18,
                ),
                SizedBox(
                  width: 2,
                ),
                Text('14.12'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
