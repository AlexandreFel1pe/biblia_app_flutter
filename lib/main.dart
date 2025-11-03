import 'package:biblia/repositories/biblia_repository.dart';
import 'package:biblia/screens/biblia_screen.dart';
import 'package:biblia/screens/old_biblia_screen.dart';
import 'package:biblia/services/biblia_json_service.dart';
import 'package:biblia/viewmodels/biblia_viewmodel.dart';
import 'package:biblia/viewmodels/old_biblia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => BibliaJsonService()),

        Provider(create: (context) => BibliaRepository(bibliaJsonService: context.read())),
        
        ChangeNotifierProvider(
          create: (context) => BibliaViewModel(
            bibliaRepository: context.read(),
          ),
        ),

        // Old
        ChangeNotifierProvider(
          create: (context) => OldBibliaViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BibliaScreen()
    );
  }   
}
