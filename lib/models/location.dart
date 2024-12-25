// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'location.g.dart';

@JsonSerializable()
class Location {
  double latitude;
  double longitude;
  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}
