
class NotModel {
  int? id;
  final String baslik;
  final String icerik;

  NotModel({this.id, required this.baslik, required this.icerik});

  Map<String, dynamic> toMap() {
    return {
      'baslik': baslik,
      'icerik': icerik,
    };
  }

  factory NotModel.fromMap(Map<String, dynamic> map) {
    return NotModel(
      id: map['id'],
      baslik: map['baslik'],
      icerik: map['icerik'],
    );
  }
}
