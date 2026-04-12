import 'package:flutter/material.dart';

// --- KURS VERİ MODELİ ---
class KursModeli {
  final String KursAdi;
  final String EgitmenAdi;
  final double IlerlemeOrani;
  final IconData KursIkonu;

  const KursModeli({
    required this.KursAdi,
    required this.EgitmenAdi,
    required this.IlerlemeOrani,
    required this.KursIkonu,
  });
}
