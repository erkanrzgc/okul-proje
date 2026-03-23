import 'package:flutter/material.dart';
import 'package:myapp/DinamikDrawerUygulamasi/appdrawer.dart';
import 'baglanti.dart';

class DinamikDrawer extends StatefulWidget {
  const DinamikDrawer({super.key});

  @override
  State<DinamikDrawer> createState() => _DinamikDrawerState();
}

class _DinamikDrawerState extends State<DinamikDrawer> {
  final List<Baglanti> _menuelemanlari = [];

  // İki farklı metin kutusu için iki controller
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _yolController = TextEditingController();

  void _elemanEkle() {
    if (_adController.text.isNotEmpty && _yolController.text.isNotEmpty) {
      setState(() {
        _menuelemanlari.add(Baglanti(_adController.text, _yolController.text));
        _adController.clear();
        _yolController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Yeni rota menüye eklendi!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gelişmiş Dinamik Menü")),
      drawer: AppDrawer(menuelemanlari: _menuelemanlari,),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _adController,
              decoration: const InputDecoration(
                labelText: "Bağlantı Görünen Adı",
                prefixIcon: Icon(Icons.label),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _yolController,
              decoration: const InputDecoration(
                labelText: "Bağlantı Yolu (Route/URL)",
                prefixIcon: Icon(Icons.link),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _elemanEkle,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Listeye ve Drawer'a Ekle"),
            ),
          ],
        ),
      ),
    );
  }
}
