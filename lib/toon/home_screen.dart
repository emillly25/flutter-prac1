import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> arr = [];
  bool isLoading = true;

  void waiting() async {
    arr = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

//useEffect (()=>{},[]) 랑 비슷한거 같음
  @override
  void initState() {
    super.initState();
    waiting();
  }

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
    );
  }
}
