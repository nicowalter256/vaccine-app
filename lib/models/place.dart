// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'location.dart';
part 'place.g.dart';

@JsonSerializable()
class Place {
  String placeID;
  String? mainText;
  int? frequency;
  int? updatedAt;
  String? subText;
  Location? location;
  Place({
    required this.placeID,
    this.mainText,
    this.frequency,
    this.updatedAt,
    this.subText,
    this.location,
  });
  factory Place.fromJson(Map<String, dynamic> json) {
    return _$PlaceFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$PlaceToJson(this);
  }
}
