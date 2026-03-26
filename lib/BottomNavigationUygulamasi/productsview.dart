import 'package:flutter/material.dart';

// --- 3. ÜRÜN LİSTESİ EKRANI ---
class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => "Ürün ${index + 1}");
    return Scaffold(
      //appBar: AppBar(title: const Text("Ürünler2")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.shopping_bag_outlined),
          title: Text(items[index]),
          subtitle: const Text("Stokta Var"),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}