import 'package:flutter/material.dart';
import '../login.dart';
import '../ayarlar.dart';
import '../kesfet.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.limeAccent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menü',
              style: TextStyle(color: Colors.white, fontSize: 24,backgroundColor: Colors.blueGrey),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Ayarlar'),
            onTap: () {
              Navigator.pop(context); // Drawer kapat
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Ayarlar(baslik: "Ayarlar"),
                ),
              );
            },
          ),
          Column(
            children: [
              Text('Keşfet Alanı'),
              Divider(),
            ],
          ),
          ListTile(
            title: Text('Keşfet'),
            onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) => Kesfet()), ),
          ),
          ListTile(
            title: Text('Discover'),
            onTap: () => Navigator.pushReplacementNamed(context, '/Discover'),
          ),
          Column(
            children: [
              Text('Uygulamalar Alanı'),
              Divider(),
            ],
          ),
          ListTile(
            title: Text('Dinamik Drawer Uygulaması'),
            onTap: () => Navigator.pushReplacementNamed(context, '/DinamikDrawerUygulaması'),
          ),
           ListTile(
            title: const Text('Bottom Navigation Uygulaması'),
            onTap: () => Navigator.pushReplacementNamed(context, '/BottomNavigationUygulaması'),

          ),
          const Divider(),
          ListTile(
            title: const Text('Giriş Yap'),
            onTap: () {
              Navigator.pop(context); // Drawer kapat
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }, //Provider.of<LoginPage>(context, listen: false).signOut(),
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                //Provider.of<GirisServis>(context, listen: false).signOut();
              },
            ),
          ),
          
          const Divider(),
           ListTile(
            title: Text('Deneme'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/Deneme'),
          ),
          /*
          ListTile(
            title: const Text('Görev Listesi'),
            //onTap: () => Navigator.pushReplacementNamed(context, '/taskList'),
          ),
          ListTile(
            title: const Text('Öğrenci Listesi'),
            //onTap: () => Navigator.pushReplacementNamed(context, '/ogrenciListesi'),
          ),
          ListTile(
            title: const Text('Shared Preferences'),
            onTap: () => Navigator.pushReplacementNamed(context, '/shared'),
          ),
          ListTile(
            title: const Text('Çıkış yap'),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),*/
        ],
      ),
    );
  }
}
