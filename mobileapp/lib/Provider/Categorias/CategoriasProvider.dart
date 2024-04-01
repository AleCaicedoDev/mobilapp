// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileapp/Modelo/Categorias/CategoriasModelo.dart';

import '../../api/AllApi.dart';

class CategoriasProvider extends ChangeNotifier {
  List<Categoria> categoria = [];

  getCategorias() async {
    String url = 'WebCategorias/webserviceapp.php?case=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    final Categorias categoria = Categorias.fromlist(dataMap['rpta']);
    print(resp);
    if (categoria.dato.isNotEmpty) {
      this.categoria = categoria.dato;
    }
    notifyListeners(); //3153701699
  }
}






//var contra1 = DBCrypt().hashpw(documento, DBCrypt().gensalt());