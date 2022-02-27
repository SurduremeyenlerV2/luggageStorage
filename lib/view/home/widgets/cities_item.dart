import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CityItem extends StatelessWidget {
  const CityItem(
      {Key? key,
      required this.cityName,
     })
      : super(key: key);

  final String cityName;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
              fit: BoxFit.fill,
              placeholder: kTransparentImage,
              image:
                  'https://cetours.net/wp-content/uploads/2020/10/london2.jpg',
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(60,20),
                      topRight: Radius.elliptical(60,20),
                    ),
                  ),
                  width: 145,
                  height: 40,
                  child: Center(
                      child: AutoSizeText(
                    cityName,
                    maxLines: 1,
                    minFontSize: 18,
                    maxFontSize: 22,
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
