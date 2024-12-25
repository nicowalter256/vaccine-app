// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'facility.g.dart';

@JsonSerializable()
class Facility {
  int id;
  String? name;
  String? amenity;
  String? cord;
  String? location;
  Facility({
    required this.id,
    required this.name,
    required this.amenity,
    required this.cord,
    required this.location,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return _$FacilityFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$FacilityToJson(this);
  }
}
