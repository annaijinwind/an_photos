import 'package:flutter/material.dart';
import 'splash.dart';
import 'folder.dart';
import 'images.dart';
import 'gallery.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: SplashPage(),
      routes: {
        '/splash': (context) => SplashPage(),
        '/folder': (context) => FolderPage(),
        '/images': (context) => ImagesPage(),
        '/gallery': (context) => GalleryPage()
      },
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
