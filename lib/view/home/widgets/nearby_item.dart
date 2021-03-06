import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';

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
    return GestureDetector(
      onTap: (){
        AutoRouter.of(context).push(const StorageDetailView());
      },
      child: Container(
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
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
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
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
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
                              'Beyo??lu',
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
      ),
    );
  }
}
