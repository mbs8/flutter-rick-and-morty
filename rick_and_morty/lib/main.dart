import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/home/presentation/page/home_page.dart';
import 'package:rick_and_morty/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(DevicePreview(builder: (_) {
    return const RickAndMortyApp();
  }));
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
