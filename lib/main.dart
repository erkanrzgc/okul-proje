import 'package:flutter/material.dart';
/*import 'homepage.dart';
import 'ayarlar.dart';
import 'giris.dart';
import 'kesfet.dart';*/
import 'discover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent
        ),
      ),
      //      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //      home: const Kesfet(),
        home: const Discover(),

      /*initialRoute: '/', // Uygulama açıldığında hangi sayfa gelsin
      routes: {
        '/': (context) => HomePage(),
        '/giris': (context) => Giris(),
        '/ayarlar': (context) => Ayarlar(baslik:'Ayar Sayfası'),
      },*/
    );
  }
}