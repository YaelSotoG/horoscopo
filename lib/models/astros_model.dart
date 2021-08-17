// To parse this JSON data, do
//
//     final astros = astrosFromMap(jsonString);

class Astros {
  Astros({
    this.titulo,
    this.horoscopo,
    this.fuente,
    this.autor,
  });

  String titulo;
  Map<String, Horoscopo> horoscopo;
  String fuente;
  String autor;

  factory Astros.fromMap(Map<String, dynamic> json) => Astros(
        titulo: json["titulo"] == null ? null : json["titulo"],
        horoscopo: json["horoscopo"] == null
            ? null
            : Map.from(json["horoscopo"]).map(
                (k, v) => MapEntry<String, Horoscopo>(k, Horoscopo.fromMap(v))),
        fuente: json["fuente"] == null ? null : json["fuente"],
        autor: json["autor"] == null ? null : json["autor"],
      );

  Map<String, dynamic> toMap() => {
        "titulo": titulo == null ? null : titulo,
        "horoscopo": horoscopo == null
            ? null
            : Map.from(horoscopo)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "fuente": fuente == null ? null : fuente,
        "autor": autor == null ? null : autor,
      };
}

class Horoscopo {
  Horoscopo({
    this.nombre,
    this.fechaSigno,
    this.amor,
    this.salud,
    this.dinero,
    this.color,
    this.numero,
  });

  String nombre;
  String fechaSigno;
  String amor;
  String salud;
  String dinero;
  String color;
  String numero;

  factory Horoscopo.fromMap(Map<String, dynamic> json) => Horoscopo(
        nombre: json["nombre"] == null ? null : json["nombre"],
        fechaSigno: json["fechaSigno"] == null ? null : json["fechaSigno"],
        amor: json["amor"] == null ? null : json["amor"],
        salud: json["salud"] == null ? null : json["salud"],
        dinero: json["dinero"] == null ? null : json["dinero"],
        color: json["color"] == null ? null : json["color"],
        numero: json["numero"] == null ? null : json["numero"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre == null ? null : nombre,
        "fechaSigno": fechaSigno == null ? null : fechaSigno,
        "amor": amor == null ? null : amor,
        "salud": salud == null ? null : salud,
        "dinero": dinero == null ? null : dinero,
        "color": color == null ? null : color,
        "numero": numero == null ? null : numero,
      };
}
