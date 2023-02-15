import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> arr = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        foregroundColor: Colors.black,
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
        future: arr,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //ListView보다 더 최적화된 기능이 많음
            // -스크롤 방향 설정 가능
            // -보여줄 아이템 갯수 설정 가능
            // 데이터를 한번에 다 가져와서 보여주는게 아니라 필요한 만큼 itemBuilder로 만들어 씀
            //즉, 한번에 로딩 X -> 필요할때 아이템 빌드해서 보여줌
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var el = snapshot.data![index];
                return Text(el.title);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
