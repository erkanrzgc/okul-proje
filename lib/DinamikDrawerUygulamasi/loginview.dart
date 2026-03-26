import 'package:flutter/material.dart';
//import 'package:myapp/DinamikDrawerUygulamasi/dinamikdraweruygulamasi.dart';

// --- 1. GİRİŞ EKRANI (LoginView) ---
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void girisiTamamla() {
    // Basit bir kontrol mekanizması
    if (userController.text == "admin" && passController.text == "1234") {
      Navigator.pushNamed(context, '/DinamikDrawer');
      /* Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DinamikDrawer()),
      );*/
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Hatalı kullanıcı adı veya şifre!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Yap")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Şifre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: girisiTamamla,
              child: const Text("Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
