import 'package:flutter/material.dart';

class OzelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String Baslik;
//  final bool AnaSayfaMi;

//  const OzelAppBar({super.key, required this.Baslik, this.AnaSayfaMi = false,});
  const OzelAppBar({super.key, required this.Baslik,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        Baslik,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFF2E3B4E),
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Yan menüyü (Drawer) açar
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      /*actions: [
        if (AnaSayfaMi)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Arama butonuna tıklandığında yapılacaklar
              print("Arama tıklandı");
            },
          ),
      ],*/
    );
  }

  // AppBar yüksekliğini belirlemek için bu zorunludur
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}