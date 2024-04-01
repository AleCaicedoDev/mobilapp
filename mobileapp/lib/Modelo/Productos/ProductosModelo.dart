// ignore_for_file: file_names
class Productos {
  List<Producto> dato = [];
  Productos();

  Productos.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Producto.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// "rp": "si",
// "id": "1",
// "codigo": "1100",
// "producto": "Lomo Viche Especial",
// "descripcion": "Lorem ipsum dolor sit amet consectetur adipiscing elit commodo ut enim rhoncus habitant mattis metus blandit mauris sem. Integer nam gravida nullam class platea fusce ultrices in imperdiet nostra natoque sollicitudin tincidunt lacus dignissim mauris lectus. Tincidunt metus litora senectus habitant vulputate luctus ad ultricies pellentesque placerat eget risus facilisi magnis mus ante mattis urna conubia nostra habitasse commodo proin. Feugiat rutrum odio lacinia magna sed primis mauris so.",
// "categoria": "1",
// "valor1": "50200",
// "valor2": "50200",
// "valor3": "50200",
// "url": "https://carnesbrangus.com/appPedidos/fotos/carnes.jpg",
// "estado": "1"

class Producto {
  String? rp;
  String? id;
  String? codigo;
  String? producto;
  String? descripcion;
  String? categoria;
  String? valor1;
  String? valor2;
  String? valor3;
  String? url;
  String? estado;

  Producto({
    this.rp,
    this.id,
    this.codigo,
    this.producto,
    this.descripcion,
    this.categoria,
    this.valor1,
    this.valor2,
    this.valor3,
    this.url,
    this.estado,
  });

  Producto.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    codigo = datos['codigo'].toString();
    producto = datos['producto'].toString();
    descripcion = datos['descripcion'].toString();
    categoria = datos['categoria'].toString();
    valor1 = datos['valor1'].toString();
    valor2 = datos['valor2'].toString();
    valor3 = datos['valor3'].toString();
    url = datos['url'].toString();
    estado = datos['estado'].toString();
  }
}
