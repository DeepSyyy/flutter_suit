import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_media/feature/first_screen/presentation/page/palindrome_page.dart';
import 'package:suit_media/feature/first_screen/presentation/provider/first_screen_provider.dart';
import 'package:suit_media/feature/third_screen/presentation/provider/third_screen_provider.dart';
import 'package:suit_media/feature/third_screen/presentation/widget/third_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirstScreenProvider()),
        ChangeNotifierProvider(create: (context) => ThirdScreenProvider())
      ],
      child: MaterialApp(
        title: 'Suitmedia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuitmediaThirdPageWidget(),
    );
  }
}
