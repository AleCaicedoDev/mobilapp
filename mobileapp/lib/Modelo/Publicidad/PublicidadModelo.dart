// ignore_for_file: file_names
class Publicidades {
  List<Publicidad> dato = [];
  Publicidades();

  Publicidades.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Publicidad.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// "rp": "si",
// "id": "1",
// "titulo": "Publicidad 1",
// "descripcion": "Lorem ipsum dolor sit amet consectetur adipiscing elit metus duis taciti magna, scelerisque dapibus.",
// "url": "https://carnesbrangus.com/appPedidos/fotos/publicidad/p11.png",
// "idProducto": "1",
// "estado": "1"

class Publicidad {
  String? rp;
  String? id;
  String? titulo;
  String? descripcion;
  String? url;
  String? idProducto;
  String? estado;

  Publicidad({
    this.rp,
    this.id,
    this.titulo,
    this.descripcion,
    this.url,
    this.idProducto,
    this.estado,
  });

  Publicidad.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    titulo = datos['titulo'].toString();
    descripcion = datos['descripcion'].toString();
    url = datos['url'].toString();
    idProducto = datos['idProducto'].toString();
    estado = datos['estado'].toString();
  }
}
