import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

///handles state management and dynamic display during route set  up
class SliderProviderService with ChangeNotifier {
  late SheetController destinationSheetController;
  late SheetController originSheetController;
  bool pickUpSet = false;
  bool isDestinationSet = false;
  bool isPickUpDestinationExpanded = false;
  bool isPickUpOriginExpanded = false;
  Uuid uuid = Uuid();

  ///this instance
  SliderProviderService? instance;

  //session timeStamp
  DateTime? sessionStartTime;
  late String sessionToken;
  bool isSessionTriggered = false;

  void notify() {
    notifyListeners();
  }

  ///generates random token
  void createRamdomTkn() {
    sessionToken = uuid.v4();
  }
}
