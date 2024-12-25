import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../constants/constants.dart';
import '../controllers/slider_provider.dart';
import '../models/place.dart';

class DestinationEntry extends StatefulWidget {
  const DestinationEntry({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DestinationEntryState createState() => _DestinationEntryState();
}

class _DestinationEntryState extends State<DestinationEntry> {
  TextEditingController pickUpController = TextEditingController();
  late String sessionToken;
  BehaviorSubject<List<Place>> behaviorSubject = BehaviorSubject();
  ScrollController scrollController = ScrollController();
  late BuildContext mContext;
  bool isFetching = false;
  String previous = "";

  @override
  void dispose() {
    pickUpController.dispose();
    behaviorSubject.close();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          Provider.of<SliderProviderService>(context, listen: false)
              .destinationSheetController
              .collapse();
        }
      }
    });
    sessionToken =
        Provider.of<SliderProviderService>(context, listen: false).sessionToken;

    pickUpController.addListener(() {
      if (pickUpController.text.isNotEmpty) {
        if (pickUpController.text != previous) {
          previous = pickUpController.text;
          if (Provider.of<SliderProviderService>(context, listen: false)
                  .isSessionTriggered ==
              false) {
            Provider.of<SliderProviderService>(context, listen: false)
                .isSessionTriggered = true;
            Provider.of<SliderProviderService>(context, listen: false)
                .sessionStartTime = DateTime.now();
          }
          DateTime currentDate = DateTime.now();

          DateTime? sessionTime =
              Provider.of<SliderProviderService>(context, listen: false)
                  .sessionStartTime;

          if (sessionTime == null) {
            Provider.of<SliderProviderService>(context, listen: false)
                .sessionStartTime = DateTime.now();
            sessionTime = DateTime.now();
          }

          Duration diff = currentDate.difference(sessionTime);
          if (diff.inMinutes > 2) {
            Provider.of<SliderProviderService>(context, listen: false)
                .createRamdomTkn();
            Provider.of<SliderProviderService>(context, listen: false)
                .sessionStartTime = DateTime.now();
          }
          fetchUserSuggestions(pickUpController.text);
        }
      }
    });
  }

  ///fetches suggestions
  fetchUserSuggestions(String search) async {
    try {
      setState(() {
        isFetching = true;
      });
      String sessionToken =
          Provider.of<SliderProviderService>(context, listen: false)
              .sessionToken;
      var response = await http.post(Uri.parse(
          '${Constants.placeSuggestionAPI}key=${Constants.apiKey}&input=$search&sessiontoken=$sessionToken&components=country:UG'));

      if (response.statusCode == 200) {
        List<Place> suggestions = [];

        for (var item in json.decode(response.body)['predictions']) {
          Place place = Place(
              mainText: item['structured_formatting']['main_text'],
              placeID: item['place_id'],
              subText: item['structured_formatting']['secondary_text']);
          suggestions.add(place);
        }

        behaviorSubject.add(suggestions);
        setState(() {
          isFetching = false;
        });
      } else {
        setState(() {
          isFetching = false;
        });
      }
    } on Exception {
      setState(() {
        isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 4, width: 40, color: Colors.grey)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'Search for a facility',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  pickUpController.clear();
                  if (KeyboardVisibilityProvider.isKeyboardVisible(mContext)) {
                    FocusScope.of(mContext).unfocus();
                  }
                  Future.delayed(const Duration(milliseconds: 50), () {
                    Provider.of<SliderProviderService>(context, listen: false)
                        .destinationSheetController
                        .collapse();
                  });
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextFormField(
                controller: pickUpController,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                decoration: InputDecoration(
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 25, maxWidth: 25),
                    suffixIcon: Visibility(
                        visible: isFetching,
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        )),
                    filled: true,
                    hintText: 'Enter location',
                    border: InputBorder.none),
                cursorColor: Theme.of(context).primaryColor,
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(top: 0),
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              StreamBuilder(
                  stream: behaviorSubject.stream,
                  builder: (context, AsyncSnapshot<List<Place>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(snapshot.data!.length,
                                    (index) {
                                  return GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Theme.of(context)
                                                      .dividerColor))),
                                      padding: const EdgeInsets.only(
                                          bottom: 17, top: 17),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Icon(
                                            Icons.location_on,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                snapshot.data![index].mainText!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                snapshot.data![index].subText ??
                                                    "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      Place place = snapshot.data![index];

                                      try {
                                        // Map<String, dynamic> response =
                                        //     await SearchRepository
                                        //         .getPlaceDetails(
                                        //             place.placeID,
                                        //             sessionToken);

                                        // Location location = Location(
                                        //     latitude: response['result']
                                        //             ['geometry']['location']
                                        //         ['lat'],
                                        //     longitude: response['result']
                                        //             ['geometry']['location']
                                        //         ['lng']);
                                        // place.location = location;

                                        // Get.to(AvailableParavetsScreen(
                                        //   locations: place,
                                        // ));

                                        //
                                      } catch (err) {
                                        //MethodHelpers.dioErrorHandler(err);
                                      }
                                    },
                                  );
                                }),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: const Text(
                            'We couldn\'t find any place matching your search\n\n Try choosing from map',
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Oops,we couldnt fetch your query, try again',
                        ),
                      );
                    }
                    return const Center(
                      child: Text('Search results will appear here'),
                    );
                  })
            ],
          ))
        ],
      ),
    );
  }
}
