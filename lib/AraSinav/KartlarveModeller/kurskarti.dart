import 'package:flutter/material.dart';
import 'kursmodeli.dart';

// --- ÖZEL KURS KARTI WIDGET'I ---
class KursKarti extends StatelessWidget {
  final KursModeli Kursverisi;

  const KursKarti({super.key, required this.Kursverisi});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // İkon Bölümü
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF2E3B4E).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Kursverisi.KursIkonu, color: const Color(0xFF2E3B4E)),
            ),
            const SizedBox(height: 16),
            // Metin Bilgileri
            Text(
              Kursverisi.KursAdi,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              Kursverisi.EgitmenAdi,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // İlerleme Çubuğu
            LinearProgressIndicator(
              value: Kursverisi.IlerlemeOrani,
              backgroundColor: Colors.grey[200],
              color: const Color(0xFF5C6BC0),
              minHeight: 4,
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "%${(Kursverisi.IlerlemeOrani * 100).toInt()}",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
