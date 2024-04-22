import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiztalent/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'YouUrlSupabase',
    anonKey: 'YouAnionKey',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MonsterQuizz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(36,42,64, 1)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


