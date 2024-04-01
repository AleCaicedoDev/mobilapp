import 'package:flutter/material.dart';
import 'package:mobileapp/ui/Categorias/CategoriaPages.dart';
import 'package:mobileapp/ui/Productos/ProductosSelectPages.dart';

import '../ui/Login/LoginPages.dart';
import '../ui/Pedido/CarritoPages.dart';
import '../ui/Perfil/PerfilPages.dart';
import '../ui/Productos/ProductosPages.dart';
import '../ui/Productos/ProductosSelectPages2.dart';
import 'construcion_page.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPages(),
    'CategoriaPages': (BuildContext context) => CategoriaPages(),
    'CarritoPages': (BuildContext context) => CarritoPages(),
    'PerfilPages': (BuildContext context) => PerfilPages(),
    'ProductosPages': (BuildContext context) => ProductosPages(),
    'ProductosSelectPages2': (BuildContext context) => ProductosSelectPages(),

    // 'SoportePages': (BuildContext context) => SoportePages(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
