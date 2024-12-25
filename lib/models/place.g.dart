// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      placeID: json['placeID'] as String,
      mainText: json['mainText'] as String?,
      frequency: (json['frequency'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      subText: json['subText'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'placeID': instance.placeID,
      'mainText': instance.mainText,
      'frequency': instance.frequency,
      'updatedAt': instance.updatedAt,
      'subText': instance.subText,
      'location': instance.location,
    };
