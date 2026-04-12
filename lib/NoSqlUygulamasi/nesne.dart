
class NesneModel {
  int? id;
  final String ad;
  final String soyad;
  final String numara;

  NesneModel({this.id, required this.ad, required this.soyad, required this.numara});

  Map<String, dynamic> toMap() {
    return {
      'name': ad,
      'surname': soyad,
      'no': numara,
    };
  }

  factory NesneModel.fromMap(Map<String, dynamic> map) {
    return NesneModel(
      id: map['id'],
      ad: map['name'],
      soyad: map['surname'],
      numara: map['no'],

    );
  }
}
