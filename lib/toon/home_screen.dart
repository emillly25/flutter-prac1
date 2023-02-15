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
            //map 같이 여러 데이터 매핑시킬떄!
            //어차피 데이터 있을때만 실행되므로 !를 붙여서 null이 절대 아니라고 말해주기
            //listView는 자동으로 scroll도 만들어줌~
            return ListView(
              children: [for (var el in snapshot.data!) Text(el.title)],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
