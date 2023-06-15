class usuarios {
  final String uid;
  final String nome;


  usuarios(this.uid, this.nome);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nome': nome
    };
  }

  factory usuarios.fromJson(Map<String, dynamic> json) {
    return usuarios(
      json['uid'],
      json['nome'],
    );
  }
}
