import 'package:dio/dio.dart';
import '../model/characters_model.dart';
import '../../helper/constant.dart';

class CharactaesticWebServices {
  late Dio dio;
  CharactaesticWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: basUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharecters() async {
    try {
      Response response = await dio.get(chararesticurl);
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
   Future<List<dynamic>> getCharacterQuotes(String charName) async {
    try {
      Response response = await dio.get('quote' , queryParameters: {'author' : charName});
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
