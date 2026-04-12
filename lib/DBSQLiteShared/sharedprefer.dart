import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer extends StatefulWidget {
  // Bu alanları final yapmak daha güvenlidir
  final bool mod; 
  final Function(bool) temaGuncelle;

  const SharedPrefer({
    super.key,
    required this.mod,
    required this.temaGuncelle,
  });

  @override
  State<SharedPrefer> createState() => _SharedPreferState();
}

class _SharedPreferState extends State<SharedPrefer> {
  final controller = TextEditingController();
  String ad = '';

  @override
  void initState() {
    super.initState();
    adiYukle();
    // NOT: _karanlikModuYukle() burada gereksiz, çünkü değer main.dart'tan geliyor.
  }

  // Kullanıcı adını yükle
  void adiYukle() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      ad = prefs.getString('kullaniciAdi') ?? '';
    });
  }

  // Kullanıcı adını kaydet
  void _adiKaydet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('kullaniciAdi', controller.text);
    adiYukle();
    controller.clear();
    // Klavye kapatmak için opsiyonel
    FocusScope.of(context).unfocus();
  }

  void temaModuDegistir(bool yeniDeger) {
    // 1. Önce dışarıdan gelen (main.dart'taki) fonksiyonu tetikle.
    // Bu, uygulamanın rengini anında değiştirir.
    widget.temaGuncelle(yeniDeger);
    
    // 2. Ardından SharedPreferences'a kaydet ki uygulama kapanınca unutmasın.
    karanlikModuKaydet(yeniDeger);
  }

  void karanlikModuKaydet(bool deger) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('karanlikMod', deger);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences Örneği"),
        actions: [
          Row(
            children: [
              const Text("🌙"),
              Switch(
                // Değeri doğrudan üst widget'tan (main) alıyoruz
                value: widget.mod, 
                onChanged: temaModuDegistir,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Hoş geldin, $ad", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Adınızı girin",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adiKaydet,
              child: const Text("Adı Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}