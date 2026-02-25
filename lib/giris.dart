import 'package:flutter/material.dart';

class Giris extends StatelessWidget {
  Giris({super.key});
  final TextEditingController kullaniciAdiKontrolcusu = TextEditingController(); // Kullanıcı adı için controller.
  final TextEditingController parolaKontrolcusu = TextEditingController(); // Şifre için controller.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Sayfası')),
      body:  Column(
          children: [
            TextField(
              controller: kullaniciAdiKontrolcusu, // Kullanıcı adı giriş alanı.
              decoration: const InputDecoration(labelText: "Kullanıcı Adı"), // Giriş kutusunun etiketi.
            ),
            TextField(
              controller: parolaKontrolcusu, // Şifre giriş alanı.
              obscureText: true, // Şifreyi gizlemek için kullanılır.
              decoration: const InputDecoration(labelText: "Şifre"),
            ),
            ElevatedButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, '/ayarlar'),
              }, // Butona basınca popup göster.
              child: const Text("Ayar sayfasına git"),
            ),
          ],
        ),
    );
  }
}
