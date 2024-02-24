import 'package:flutter/material.dart';
import 'package:quiztalent/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fpkmzlnhypkqfhmatgzj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZwa216bG5oeXBrcWZobWF0Z3pqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg3MTAwMzcsImV4cCI6MjAyNDI4NjAzN30.gcfx4KGOrRhCx7gnrrg1SxlGKHrqTtypLzgOtMIqJHs',
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


