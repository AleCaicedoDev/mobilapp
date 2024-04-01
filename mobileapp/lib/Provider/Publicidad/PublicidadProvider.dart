// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../Modelo/Publicidad/PublicidadModelo.dart';

import '../../api/AllApi.dart';

class PublicidadProvider extends ChangeNotifier {
  List<Publicidad> publicidad = [];

  getPublicidad() async {
    String url = 'WebPublicidad/webserviceapp.php?case=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    final Publicidades publicidad = Publicidades.fromlist(dataMap['rpta']);
    print(resp);
    if (publicidad.dato.isNotEmpty) {
      this.publicidad = publicidad.dato;
    }
    notifyListeners(); //3153701699
  }
}






//var contra1 = DBCrypt().hashpw(documento, DBCrypt().gensalt());