import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'board.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // ignore: deprecated_member_use
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(const PuzzPuzz());
}

class PuzzPuzz extends StatelessWidget {
  const PuzzPuzz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuzzPuzz',
      debugShowCheckedModeBanner: false,

      // ignore: prefer_const_constructors
      home: Board(),
    );
  }
}
