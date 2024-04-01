import 'package:flutter/material.dart';
import 'package:mobileapp/ui/Productos/ProductosSelectPages.dart';

import '../ui/Categorias/CategoriaPages.dart';
import '../ui/Home/PrincipalPages.dart';
import '../ui/Pedido/CarritoPages.dart';
import '../ui/Perfil/PerfilPages.dart';

class Seting extends ChangeNotifier {
  late PageController pageController;
  int tabIndex = 0;
  int tabIndexNavBar = 0;
  int get tabIndexGet => tabIndex;

  iniSetingNavBar() {
    pageController = PageController(initialPage: tabIndex);
  }

  List<Widget> buildScreens() {
    return [
      PrincipalPages(),
      CategoriaPages(),
      CarritoPages(),
      PerfilPages(),
      ProductosSelectPages()
    ];
  }

  replaceTo(int view, int cicleNav) {
    tabIndex = view;
    tabIndexNavBar = cicleNav;
    pageController.jumpToPage(view);

    notifyListeners();
  }
}
