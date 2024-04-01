import 'package:flutter/material.dart';
import 'package:mobileapp/Provider/Publicidad/PublicidadProvider.dart';
import 'package:mobileapp/router/routers.dart';
// import 'package:mobileapp/ui/Home/HomePages.dart';
import 'package:provider/provider.dart';

import 'Provider/Categorias/CategoriasProvider.dart';
import 'Provider/Productos/ProductosProvider.dart';
import 'Seting/Seting.dart';
import 'api/AllApi.dart';
import 'ui/Home/HomePages.dart';

void main() {
  AllApi.configuteDio();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => Seting()), //CategoriasProvider
        ChangeNotifierProvider(
            lazy: false, create: (_) => PublicidadProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => CategoriasProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ProductosProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: getRutas(),
      home: const SafeArea(child: HomePages()),
    );
  }
}
