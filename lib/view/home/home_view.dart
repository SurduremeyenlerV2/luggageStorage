import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luggage_storage/core/consts/nearByLocations.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:luggage_storage/product/state/homeCubit/home_cubit.dart';
import 'package:luggage_storage/view/home/widgets/cities_item.dart';
import 'package:luggage_storage/view/home/widgets/nearby_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController nearbyLocationsController =
      PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  PageController topCitiesController =
      PageController(initialPage: 0, viewportFraction: 0.4, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCities(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          state as HomeLoaded;
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  AutoRouter.of(context).push(MapLocationView());
                },
                label: Text('Find Me'),
                backgroundColor: Colors.cyanAccent.shade200,
              ),
              appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 171, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 55,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: TextField(
                              cursorColor: Colors.grey[700],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search City or Adress',
                                icon: Icon(Icons.search),
                                iconColor: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nearby Locations',
                            style: TextStyle(fontSize: 18),
                          )),
                      Flexible(
                        flex: 4,
                        child: PageView.builder(
                            padEnds: false,
                            pageSnapping: true,
                            controller: nearbyLocationsController,
                            scrollDirection: Axis.horizontal,
                            itemCount: NearByLocations.nearByLocations.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: LocationItem(
                                    colorLeft: Colors.cyanAccent.shade400,
                                    colorRight:
                                        Color.fromARGB(255, 178, 255, 255),
                                    description: NearByLocations
                                        .nearByLocations[index].description,
                                    title: NearByLocations
                                        .nearByLocations[index].title),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Top Cities',
                            style: TextStyle(fontSize: 18),
                          )),
                      Flexible(
                        flex: 6,
                        child: PageView.builder(
                          padEnds: false,
                          pageSnapping: true,
                          controller: topCitiesController,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cities.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CityItem(
                                cityImgUrl: state.cities[index]['cityImage'],
                                cityName: state.cities[index]['cityName'],
                                lat: '41.1',
                                long: '41.0',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
