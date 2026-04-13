import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'nesne.dart';


// DatabaseHelper sınıfı SQLite işlemlerini yöneten singleton bir yardımcı sınıftır.
class VeriTabani {
  static final VeriTabani instance = VeriTabani.init(); // Singleton instance
  static Database? yeniDatabase; // SQLite veritabanı nesnesi
  VeriTabani.init(); // Özel constructor

  // Veritabanı erişimi için getter
  Future<Database> get yeniVeriTabani async {
    if (yeniDatabase != null) return yeniDatabase!; // Daha önce oluşturulduysa onu döndür
    yeniDatabase = await initDB('nesneler.db'); // Yoksa oluştur
    return yeniDatabase!;
  }

  // Veritabanını oluşturur ve/veya açar.
  Future<Database> initDB(String fileName) async {
    final dir = await getApplicationDocumentsDirectory(); // Uygulamanın belge dizini
    final path = join(dir.path, fileName); // Belge dizinine dosya adı eklenerek tam yol oluşturulur

    // Veritabanı açılır. İlk kez açılıyorsa _createDB çalışır.
    return await openDatabase(
      path,
      version: 1,
      onCreate: olustur,
    );
  }

  // İlk defa veritabanı oluşturuluyorsa çalışır.
  Future olustur(Database db, int version) async {
    await db.execute('''
      CREATE TABLE NesneTablosu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        surname TEXT NOT NULL,
        no TEXT NOT NULL
      )
    ''');
  }
  // SQL ile not ekle
  Future<int> insertNoteWithRawSQL(NesneModel nesne) async {
    final db = await instance.yeniVeriTabani;
    return await db.rawInsert(
      'INSERT INTO NesneTablosu(name, surname, no) VALUES(?, ?, ?)',
      [nesne.ad, nesne.soyad, nesne.numara],
    );
  }

  // SQL ile tüm notları getir
  Future<List<NesneModel>> readAllNotesWithRawSQL() async {
    final db = await instance.yeniVeriTabani;
    final result = await db.rawQuery('SELECT * FROM NesneTablosu');
    return result.map((e) => NesneModel.fromMap(e)).toList();
  }

  // SQL ile güncelleme
  Future<int> updateNoteWithRawSQL(NesneModel nesne) async {
    final db = await instance.yeniVeriTabani;
    return await db.rawUpdate(
      'UPDATE NesneTablosu SET name = ?, soyad = ?, numara = ? WHERE id = ?',
      [nesne.ad, nesne.soyad, nesne.numara],
    );
  }

  // SQL ile silme
  Future<int> deleteNoteWithRawSQL(int id) async {
    final db = await instance.yeniVeriTabani;
    return await db.rawDelete(
      'DELETE FROM NesneTablosu WHERE id = ?',
      [id],
    );
  }

  // Veritabanı bağlantısını kapatır.
  Future close() async {
    final db = await instance.yeniVeriTabani;
    db.close();
  }
}