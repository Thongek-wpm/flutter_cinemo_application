import 'package:dio/dio.dart';

import '../screens/viewUi.dart';

Future<List<dynamic>> fetchFavorites() async {
  try {
    Response response =
        await dio.get('https://www.majorcineplex.com/apis/get_movie_avaiable');
    if (response.statusCode == 200) {
      // ดึงข้อมูลจาก response
      List<dynamic> favorites = response.data['favorites'];
      return favorites;
    } else {
      // กรณีเซิร์ฟเวอร์ตอบกลับแตกต่างจาก 200 OK
      throw Exception('Failed to fetch favorites');
    }
  } catch (e) {
    // กรณีเกิดข้อผิดพลาดในการเชื่อมต่อหรือรับข้อมูล
    throw Exception('Failed to connect to server');
  }
}
