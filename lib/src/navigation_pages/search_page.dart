import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/cubit/cubit_states.dart';
import 'package:visit_nepal/widgets/custom_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List filteredInfo = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterPlaces);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterPlaces() {
    setState(() {
      filteredInfo = context.read<AppCubits>().places.where((place) {
        return place.name
            .toString()
            .toLowerCase()
            .startsWith(searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Search Places",
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search places...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: filteredInfo.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CustomText(text: "$index"),
                            SizedBox(
                              width: 20,
                            ),
                            CustomText(
                              text: filteredInfo[index].name.length < 20
                                  ? filteredInfo[index].name
                                  : filteredInfo[index].name.substring(0, 18),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CustomText(
                text: "Error Loading",
                color: Colors.red,
                fontSize: 18,
              ),
            );
          }
        },
      ),
    );
  }
}
