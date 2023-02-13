import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

//async함수이기 때문에, 무조건 Future를 반환 -> 그러므로 Future안에 함수가 실행되고 반환하고싶은 타입 쓰면 됨
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      //성공 -> json을 디코딩 함 -> 응답 : [{title:'', thumbs:'', id:''}]
      final List<dynamic> webtoons = jsonDecode(res.body);
      //배열을 돌면서 하나하나(obj)를 mainInfo Consturctor로 초기화 시켜줌
      for (var obj in webtoons) {
        //만들어진 객체들을 배열에 다시 저장함
        webtoonInstances.add(WebtoonModel.mainInfo(obj));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
