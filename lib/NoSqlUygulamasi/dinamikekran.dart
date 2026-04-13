import 'package:flutter/material.dart';
import 'package:myapp/NoSqlUygulamasi/veritabani.dart';
import 'package:sqflite/sqflite.dart';
import 'nesne.dart';
import 'veritabani.dart';


class DinamikWidgetEkrani extends StatefulWidget {
  @override
  DinamikWidgetEkraniState createState() => DinamikWidgetEkraniState();
}

class DinamikWidgetEkraniState extends State<DinamikWidgetEkrani> {
  List<String> displayedtexts = [];

  // ÖNEMLİ: Her satırın içindeki TextField verisini yakalamak için controller listesi
  List<TextEditingController> metinKutusuWidgetlari = [];




  Future<void> Kaydet(NesneModel nesne) async {
    try {

      final yeniNot = NesneModel(ad: nesne.ad, soyad: nesne.soyad, numara: nesne.numara );
      await VeriTabani.instance.insertNoteWithRawSQL(yeniNot);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Tüm veriler NesneTablosu'na başarıyla kaydedildi!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Veritabanı hatası: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hata oluştu: $e"), backgroundColor: Colors.red),
      );
    }
  }

  void Nesneeklemedialog() {
    int count = 0;
    showDialog(
      context: context,
      builder: (context) {
        List<TextEditingController> TextWidgetlariListesi = [];
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Widget Detaylarını Girin"),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: "Kaç adet widget eklenecek?"),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setDialogState(() {
                          count = int.tryParse(val) ?? 0;
                          TextWidgetlariListesi = List.generate(count, (index) => TextEditingController());
                        });
                      },
                    ),
                    const Divider(),
                    if (count > 0)
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: count,
                          itemBuilder: (context, index) {
                            return TextField(
                              controller: TextWidgetlariListesi[index],
                              decoration: InputDecoration(labelText: "${index + 1}. Widget Metni"),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("İptal")),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      for (var controller in TextWidgetlariListesi) {
                        if (controller.text.isNotEmpty) {
                          displayedtexts.add(controller.text);
                          // Her yeni satır için yeni bir controller oluşturuyoruz
                          metinKutusuWidgetlari.add(TextEditingController());
                        }
                      }
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Tamamla ve Ekle"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SQLite Dinamik Kayıt")),
      body: Column(
        children: [


        ],
      ),
    );
  }
}