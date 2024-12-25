import 'package:dio_http/dio_http.dart';

import '../constants/constants.dart';
import '../models/facility.dart';

class FacilityRepository {
  static Future<List<Facility>> searchFacilities(String? query) async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: Constants.baseURL,
        method: 'GET',
        connectTimeout: Constants.timeOut,
        responseType: ResponseType.json);
    Dio dio = Dio(baseOptions);

    try {
      final response = await dio
          .request('facilities/search', queryParameters: {'search': query});

      List<Facility> facilities = [];
      for (Map<String, dynamic> facility in response.data['data']) {
        facilities.add(Facility.fromJson(facility));
      }
      return facilities;
    } catch (__) {
      rethrow;
    }
  }
}
