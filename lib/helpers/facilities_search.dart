import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../models/facility.dart';
import '../repositories/facility_repository.dart';
import '../widgets/error_widget.dart';
import '../widgets/facility_widget.dart';

class FacilitySearchDelegate extends SearchDelegate {
  AsyncSnapshot<List<Facility>>? dataSnapshot;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Search for health facilities.'),
      );
    } else {
      if (dataSnapshot!.hasError) {
        return AppErrorWidget(
          exception: dataSnapshot!.error,
          onTap: () => {},
        );
      } else {
        List<Facility>? results = dataSnapshot!.data;
        List<Facility> filteredFacilities = results!.toList();

        if (results.isEmpty) {
          return const Center(
            child: Text('No facility matching name.'),
          );
        } else {
          if (filteredFacilities.isEmpty) {
            return Container();
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    for (var i = 0; i < filteredFacilities.length; i++)
                      FacilityWidget(
                        facility: filteredFacilities[i],
                      )
                  ],
                ),
              ),
            );
          }
        }
      }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Search for facilities.'));
    } else {
      return FutureBuilder<List<Facility>>(
          future:
              FacilityRepository.searchFacilities(query.trim().toUpperCase()),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              dataSnapshot = snapshot;
              if (snapshot.hasError) {
                return AppErrorWidget(
                  exception: dataSnapshot!.error,
                  onTap: () => {},
                );
              } else {
                List<Facility>? results = dataSnapshot!.data;
                List<Facility> filteredProducts = results!.toList();
                List<Facility> products = results.toList();

                if (results.isEmpty) {
                  return const Center(
                      child: Text('No facility matching name.'));
                } else {
                  if (products.isNotEmpty) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: StaggeredGrid.count(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          children: [
                            for (var i = 0; i < products.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        opacity: 0.2,
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage('assets/back.jpg'),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Name: ${products[i].name}'),
                                        if (products[i].location != null)
                                          Text(
                                              'Location: ${products[i].location}'),
                                        // if (products[i].amenity != null)
                                        //   Text(
                                        //       'Amenity: ${products[i].amenity}'),
                                        if (products[i].cord != null)
                                          Text('cord: ${products[i].cord}'),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  } else if (filteredProducts.isNotEmpty) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          children: [
                            for (var i = 0; i < filteredProducts.length; i++)
                              InkWell(
                                onTap: () => {
                                  // Get.to(ProductDetails(
                                  //   product: filteredProducts[i],
                                  // ))
                                },
                                child: FacilityWidget(
                                  facility: filteredProducts[i],
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }
              }
            }
          });
    }
  }
}
