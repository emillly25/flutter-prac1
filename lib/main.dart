import 'package:flutter/material.dart';
import 'package:toonflix/toon/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: HomeScreen(),
      ),
    );
  }
}




//뽀모도로 용
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         backgroundColor: const Color(0xFFE7626C),
//         textTheme: const TextTheme(
//           headline1: TextStyle(
//             color: Color(0xFF232B55),
//           ),
//         ),
//         cardColor: const Color(0xFFF4EDDB),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
