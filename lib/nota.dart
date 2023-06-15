import 'materiaflutter.dart';


class Nota {
  final String uid;
  final String titulo;
  final String descricao;

  Nota(this.uid, this.titulo, this.descricao);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao
    };
  }

  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      json['uid'],
      json['titulo'],
      json['descricao'],
    );
  }
}