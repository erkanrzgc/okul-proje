import 'package:flutter/material.dart';
import 'package:myapp/DinamikDrawerUygulamasi/loginview.dart';


// --- 5. AYARLAR EKRANI ---
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Ayarlar2")),
      body: Column(
        children: [
          const ListTile(leading: Icon(Icons.person), title: Text("Profil Bilgileri")),
          const Divider(),
          SwitchListTile(value: true, onChanged: (v) {}, title: const Text("Bildirimleri Yönet")),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Çıkış Yap", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView())),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}