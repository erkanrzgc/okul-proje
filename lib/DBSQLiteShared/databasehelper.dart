import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


import 'notmodel.dart';

// DatabaseHelper sınıfı SQLite işlemlerini yöneten singleton bir yardımcı sınıftır.
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init(); // Singleton instance
  static Database? _database; // SQLite veritabanı nesnesi
  DatabaseHelper._init(); // Özel constructor

  // Veritabanı erişimi için getter
  Future<Database> get database async {
    if (_database != null) return _database!; // Daha önce oluşturulduysa onu döndür
    _database = await _initDB('notes.db'); // Yoksa oluştur
    return _database!;
  }

  // Veritabanını oluşturur ve/veya açar.
  Future<Database> _initDB(String fileName) async {
    final dir = await getApplicationDocumentsDirectory(); // Uygulamanın belge dizini
    final path = join(dir.path, fileName); // Belge dizinine dosya adı eklenerek tam yol oluşturulur

    // Veritabanı açılır. İlk kez açılıyorsa _createDB çalışır.
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // İlk defa veritabanı oluşturuluyorsa çalışır.
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');
  }

  // --- ORM benzeri kullanım ---
  Future<int> notOlustur(NotModel note) async {
    final db = await instance.database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<NotModel>> readAllNotes() async {
    final db = await instance.database;
    final result = await db.query('notes');
    return result.map((e) => NotModel.fromMap(e)).toList();
  }

  Future<int> updateNote(NotModel note) async {
    final db = await instance.database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // --- SQL sorguları ile manuel kullanım ---

  // SQL ile not ekle
  Future<int> createNoteWithRawSQL(NotModel note) async {
    final db = await instance.database;
    return await db.rawInsert(
      'INSERT INTO notes(title, content) VALUES(?, ?)',
      [note.baslik, note.icerik],
    );
  }

  // SQL ile tüm notları getir
  Future<List<NotModel>> readAllNotesWithRawSQL() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * FROM notes');
    return result.map((e) => NotModel.fromMap(e)).toList();
  }

  // SQL ile güncelleme
  Future<int> updateNoteWithRawSQL(NotModel note) async {
    final db = await instance.database;
    return await db.rawUpdate(
      'UPDATE notes SET title = ?, content = ? WHERE id = ?',
      [note.baslik, note.icerik, note.id],
    );
  }

  // SQL ile silme
  Future<int> deleteNoteWithRawSQL(int id) async {
    final db = await instance.database;
    return await db.rawDelete(
      'DELETE FROM notes WHERE id = ?',
      [id],
    );
  }

  // Veritabanı bağlantısını kapatır.
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}