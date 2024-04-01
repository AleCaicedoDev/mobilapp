// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../Modelo/Productos/ProductosModelo.dart';

import '../../api/AllApi.dart';

class ProductosProvider extends ChangeNotifier {
  List<Producto> productos = [];
  late String isIdSelectCategoria;
  late String isSelectCategoria;

  getProductos() async {
    String url =
        'WebProductos/webserviceapp.php?case=1&id=$isIdSelectCategoria';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    final Productos productos = Productos.fromlist(dataMap['rpta']);
    print(resp);
    if (productos.dato.isNotEmpty) {
      this.productos = productos.dato;
    }
    notifyListeners(); //3153701699
  }
}






//var contra1 = DBCrypt().hashpw(documento, DBCrypt().gensalt());