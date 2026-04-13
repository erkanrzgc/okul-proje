import 'package:flutter/material.dart';


class DinamikWidgetEkrani extends StatefulWidget {
  @override
  DinamikWidgetEkraniState createState() => DinamikWidgetEkraniState();
}

class DinamikWidgetEkraniState extends State<DinamikWidgetEkrani> {
  // Ekranda gösterilecek nihai metin listesi
  List<String> displayedtexts = [];

  // Popup içindeki dinamik alanları yöneten fonksiyon
  void Nesneeklemedialog() {
    int count = 0;
    // Popup içindeki state'i yönetmek için StatefulBuilder kullanıyoruz
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
                          // Sayı değiştikçe controller listesini güncelle
                          TextWidgetlariListesi = List.generate(
                              count,
                                  (index) => TextEditingController()
                          );
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
                              decoration: InputDecoration(
                                labelText: "${index + 1}. Widget Metni",
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("İptal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Her bir controller'daki metni ana listeye ekle
                      for (var controller in TextWidgetlariListesi) {
                        if (controller.text.isNotEmpty) {
                          displayedtexts.add(controller.text);
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
      appBar: AppBar(title: const Text("Gelişmiş Dinamik Ekleme")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: Nesneeklemedialog,
                  child: const Text("Dinamik Form Aç"),
                ),
                ElevatedButton(
                  onPressed: () {}, // Firebase ileride bağlanacak
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text("Firebase'e Gönder"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedtexts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(displayedtexts[index]),
                    subtitle: const TextField(
                      decoration: InputDecoration(hintText: "Cevabınızı buraya yazın..."),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}