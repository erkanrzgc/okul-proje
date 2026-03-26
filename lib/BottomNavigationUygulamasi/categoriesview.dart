import 'package:flutter/material.dart';

// --- 4. KATEGORİ LİSTESİ EKRANI ---
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> kategoriler = ["Elektronik", "Giyim", "Ev & Yaşam", "Spor", "Kitap", "Hobi","Beyaz Eşya"];
    return Scaffold(
      //appBar: AppBar(title: const Text("Kategoriler2")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemCount: kategoriler.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(color: Colors.blueGrey[50], 
          borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text(kategoriler[index], 
          style: const TextStyle(fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}