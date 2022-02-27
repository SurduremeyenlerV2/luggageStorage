import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:transparent_image/transparent_image.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    Key? key,
    required this.cityName,
    required this.cityImgUrl,
    required this.lat,
    required this.long,
  }) : super(key: key);

  final String cityName;
  final String cityImgUrl;
  final String lat;
  final String long;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(MapCityView(lat: lat, long: long));
      },
      child: Container(
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
                fit: BoxFit.cover,
                placeholder: kTransparentImage,
                image: cityImgUrl,
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(60, 20),
                        topRight: Radius.elliptical(60, 20),
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
      ),
    );
  }
}
