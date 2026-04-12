import 'package:flutter/material.dart';

class AltMenu extends StatelessWidget {
  final Function(int) TiklamaFonksiyonu;
  final int Seciliindis;

  const AltMenu({
    super.key,
    required this.Seciliindis,
    required this.TiklamaFonksiyonu,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Seciliindis,
      onTap: (Indis) {
        // Ana sayfadaki setState fonksiyonunu tetikler
        TiklamaFonksiyonu(Indis);
      },
      selectedItemColor: const Color(0xFF2E3B4E),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          activeIcon: Icon(Icons.assignment),
          label: 'Kurslar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_month),
          label: 'Takvim',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}