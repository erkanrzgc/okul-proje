import 'package:flutter/material.dart';
import 'package:myapp/BottomNavigationUygulamasi/mainlayoutview.dart';
import 'package:myapp/DBSQLiteShared/notarayuz.dart';
import 'package:myapp/DinamikDrawerUygulamasi/dinamikdraweruygulamasi.dart';
import 'package:myapp/DinamikDrawerUygulamasi/loginview.dart';
import 'package:myapp/discover.dart';
//import 'package:myapp/login.dart';
import 'homepage.dart';
import 'ayarlar.dart';
import 'giris.dart';
import 'kesfet.dart';
//import 'AraSinav/arasinavuygulamasi.dart';
import 'DBSQLiteShared/sharedprefer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
  //runApp(const AraSinavUygulamasi());
}

// 1. MyApp artık bir StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool temaDurumu = false;

  @override
  void initState() {
    super.initState();
    temaDurumunuYukle(); // Uygulama açılırken tercihi oku
  }

  void temaDurumunuYukle() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      temaDurumu = prefs.getBool('temaMod') ?? false;
    });
  }

  void temaDegistir(bool deger) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('temaMod', deger); // Kalıcı kaydet
    setState(() {
      temaDurumu = deger; // Ekranı yenile
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      // 5. Tema burada dinamik olarak değişiyor
      theme: temaDurumu ? ThemeData.dark() : ThemeData.light(),
      
      initialRoute: '/NotArayuz',
      routes: {
        '/': (context) => HomePage(),
        '/giris': (context) => Giris(),
        '/ayarlar': (context) => Ayarlar(baslik: 'Ayar Sayfası'),
        '/Kesfet': (context) => Kesfet(),
        '/Discover': (context) => Discover(),
        '/DinamikDrawerLogin': (context) => LoginView(),
        '/DinamikDrawer': (context) => DinamikDrawer(),
        '/BottomNavigationUygulamasi': (context) => MainLayoutView(),
        
        // 6. Veriyi ve fonksiyonu sayfaya gönderiyoruz
        '/SharedPreferences': (context) => SharedPrefer(
              mod: temaDurumu,
              temaGuncelle: temaDegistir,
            ),
        '/NotArayuz': (context) => NotArayuz(),
      },
    );
  }
}

/*
class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),

      //      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //      home: const Kesfet(),
      // home: const Discover(),
      //home: const LoginPage(),
      initialRoute:
          '/SharedPreferences', // Uygulama açıldığında hangi sayfa gelsin
      routes: {
        '/': (context) => HomePage(),
        '/giris': (context) => Giris(),
        '/ayarlar': (context) => Ayarlar(baslik: 'Ayar Sayfası'),
        '/Kesfet': (context) => Kesfet(),
        '/Discover': (context) => Discover(),
        '/Deneme': (context) => Deneme(),
        '/DinamikDrawerLogin': (context) => LoginView(),
        '/DinamikDrawer': (context) => DinamikDrawer(),
        '/BottomNavigationUygulamasi': (context) => MainLayoutView(),
        '/SharedPreferences': (context) => SharedPrefer(),
        '/NotArayuz': (context) => NotArayuz(),
      },
    );
  }
}
*/