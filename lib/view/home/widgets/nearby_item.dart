import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  const LocationItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.colorLeft,
      required this.colorRight})
      : super(key: key);

  final String title;
  final String description;
  final Color colorLeft;
  final Color colorRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorLeft, colorRight],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                      ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hotel',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.location_city,
                            size: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Beyoğlu',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            size: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}