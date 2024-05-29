import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/cubit/cubit_states.dart';
import 'package:visit_nepal/widgets/custom_container.dart';
import 'package:visit_nepal/widgets/custom_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  List travelIcons = [
    Icons.flight, // Airplane
    Icons.hotel, // Hotel
    Icons.directions_car, // Car
    Icons.train, // Train
    Icons.directions_boat, // Boat
    Icons.beach_access, // Beach
    Icons.map, // Map
    Icons.local_dining, // Dining
    Icons.local_cafe, // Cafe
    Icons.local_bar, // Bar
    Icons.camera_alt, // Camera
    Icons.local_mall, // Shopping
    Icons.hiking, // Hiking
    Icons.local_airport, // Airport
    Icons.local_taxi, // Taxi
    Icons.directions_bus, // Bus
    Icons.terrain, // Terrain
    Icons.nature, // Nature
    Icons.place, // Place
    Icons.local_parking, // Parking
  ];

  List<String> travelIconsName = [
    'Airplane',
    'Hotel',
    'Car',
    'Train',
    'Boat',
    'Beach',
    'Map',
    'Dining',
    'Cafe',
    'Bar',
    'Camera',
    'Shopping',
    'Hiking',
    'Airport',
    'Taxi',
    'Bus',
    'Terrain',
    'Nature',
    'Place',
    'Parking',
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;

            return Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 9, right: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(
                    text: "Discover",
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.blue,
                    indicatorColor: Colors.green,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: const [
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Culture",
                      ),
                      Tab(
                        text: "Adventure",
                      ),
                      Tab(
                        text: "Mountains",
                      ),
                      Tab(
                        text: "Peace",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<AppCubits>(context)
                                      .detailPage(info[index]);
                                },
                                child: CustomContainer(
                                  imageName: "assets/x.jpg",
                                  child: CustomText(
                                    text: info[index].name,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CustomContainer(
                              imageName: "assets/e.jpg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/l.png",
                            ),
                          ],
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CustomContainer(
                              imageName: "assets/1.jpeg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/f.jpg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/bu.png",
                            ),
                          ],
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CustomContainer(
                              imageName: "assets/mm.jpg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/m.jpg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/mmm.jpg",
                            ),
                          ],
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CustomContainer(
                              imageName: "assets/ara.jpeg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/pp.jpg",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomContainer(
                              imageName: "assets/p.jpg",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Explore more",
                        fontSize: 20,
                      ),
                      CustomText(
                        text: "see all",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: travelIcons.length,
                      itemBuilder: (_, index) {
                        String names = travelIconsName[index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                travelIcons[index],
                                size: 40,
                              ),
                              CustomText(
                                text: names,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Error Loading"),
            );
          }
        },
      ),
    );
  }
}
