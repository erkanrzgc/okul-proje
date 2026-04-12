
import 'package:flutter/material.dart';
import 'databasehelper.dart';
import 'notmodel.dart';

class NotArayuz extends StatefulWidget {
  const NotArayuz({super.key});

  @override
  NotelarArayuzState createState() => NotelarArayuzState();
}

class NotelarArayuzState extends State<NotArayuz> {
  final TextEditingController baslikKutusu = TextEditingController();
  final TextEditingController icerikKutusu = TextEditingController();
  List<NotModel> notlar = [];

  @override
  void initState() {
    super.initState();
    notlariListele();
  }

  @override
  void dispose() {
    baslikKutusu.dispose();
    icerikKutusu.dispose();
    super.dispose();
  }

  Future<void> notlariListele() async {
    final data = await DatabaseHelper.instance.readAllNotes();
    setState(() {
      notlar = data;
    });
  }

  Future<void> notEkle() async {
    final yeniNot = NotModel(baslik: baslikKutusu.text, icerik: icerikKutusu.text);
    await DatabaseHelper.instance.notOlustur(yeniNot);
    baslikKutusu.clear();
    icerikKutusu.clear();
    notlariListele();
  }

  Future<void> notSil(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    notlariListele();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Notları')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: baslikKutusu,
                decoration: const InputDecoration(labelText: 'Başlık'),
              ),
              TextField(
                controller: icerikKutusu,
                decoration: const InputDecoration(labelText: 'İçerik'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: notEkle,
                child: const Text('Not Ekle'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notlar.length,
                  itemBuilder: (context, index) {
                    final notnesnesi = notlar[index];
                    return Card(
                      child: ListTile(
                        title: Text(notnesnesi.baslik),
                        subtitle: Text(notnesnesi.icerik),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => notSil(notnesnesi.id!),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
