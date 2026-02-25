import 'package:flutter/material.dart';

class Ayarlar extends StatelessWidget {
  const Ayarlar({super.key,required this.baslik});
  final String baslik;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(baslik)),
      body:  Column(
          children: [
            Text("Ayar Sayfası"), 
            ElevatedButton(
              onPressed: ()=>{
                Navigator.pushNamed(context, '/'),
              }, // Butona basınca popup göster.
              child: const Text("Ana sayfaya git"),
            ),
          ],
        ),
    );
  }
}
