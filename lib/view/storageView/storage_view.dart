import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:luggage_storage/view/bookView/book_view.dart';
import 'package:transparent_image/transparent_image.dart';

class StorageDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                SizedBox(height: 10,),
                Center(child: bookNowWidget(context)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding bookNowWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          buildBookingSheet(
            context: context,
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.cyan),
          height: 60,
          width: MediaQuery.of(context).size.width*0.9,
          child: const Padding(
            padding: EdgeInsets.all(15),
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
    );
  }

  Column proportiesWidget() {
    return Column(
      children: [
        iconAndTextWidget(
            icon2: Icon(Icons.flash_auto_outlined),
            text: '3 Min Fast Check In'),
        const SizedBox(
          height: 20,
        ),
        iconAndTextWidget(icon2: Icon(Icons.lock), text: 'Locked / Supervised'),
        const SizedBox(
          height: 20,
        ),
        iconAndTextWidget(
            icon2: Icon(Icons.blur_on_outlined),
            text: 'Online reservation mandatory'),
        const SizedBox(
          height: 20,
        ),
        iconAndTextWidget(
            icon2: Icon(Icons.qr_code_scanner_rounded),
            text: 'Contactless procedures'),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Container iconAndTextWidget({required String text, required Icon icon2}) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon2,
          SizedBox(
            width: 10,
          ),
          Text(text)
        ],
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

  AppBar appBarWidget(Size size) {
    return AppBar(
      toolbarHeight: 100,
      flexibleSpace: FadeInImage.memoryNetwork(
        fit: BoxFit.cover,
        placeholder: kTransparentImage,
        image:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.HVd6p6pO8GtkqN4Jhe0rfgHaE8%26pid%3DApi&f=1',
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
                  Icons.access_time_filled,
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
