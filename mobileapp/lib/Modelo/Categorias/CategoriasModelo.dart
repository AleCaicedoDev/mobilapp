// ignore_for_file: file_names
class Categorias {
  List<Categoria> dato = [];
  Categorias();

  Categorias.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Categoria.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// "rp": "si",
// "id": "1",
// "categoria": "Res",
// "url": "https://carnesbrangus.com/appPedidos/fotos/categorias/carnes.jpg",
// "icon": "https://carnesbrangus.com/appPedidos/fotos/categorias/iconvaca.png",
// "estado": "1"

class Categoria {
  String? rp;
  String? id;
  String? categoria;
  String? url;
  String? icon;
  String? estado;

  Categoria({
    this.rp,
    this.id,
    this.categoria,
    this.url,
    this.icon,
    this.estado,
  });

  Categoria.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    categoria = datos['categoria'].toString();
    url = datos['url'].toString();
    icon = datos['icon'].toString();
    estado = datos['estado'].toString();
  }
}
