// ignore_for_file: file_names

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iconsax/iconsax.dart';

import 'package:provider/provider.dart';

import '../../Seting/Seting.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> with TickerProviderStateMixin {
  set tabIndex(int v) {
    final provider = Provider.of<Seting>(context, listen: false);
    provider.tabIndex = v;
    provider.tabIndexNavBar = v;
  }

  @override
  void initState() {
    Provider.of<Seting>(context, listen: false).iniSetingNavBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Seting>(context);
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: provider.pageController,
        onPageChanged: (value) {
          setState(() {
            tabIndex = value;
            provider.pageController.jumpToPage(provider.tabIndex);
          });
        },
        children: [...provider.buildScreens()],
      ),
      bottomNavigationBar: CircleNavBar(
          elevation: 5,
          shadowColor: Colors.grey,
          circleColor: Colors.white,
          activeIndex: provider.tabIndex,
          onTap: (index) {
            tabIndex = index;

            provider.pageController.jumpToPage(provider.tabIndex);
            setState(() {});
          },
          activeIcons: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.home,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.category4,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Categorias',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.shop,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Carrito',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.user_square,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Perfil',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
          inactiveIcons: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.home,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.category4,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Categorias',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.shop,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Carrito',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Iconsax.user_square,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    'Perfil',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
          height: 64,
          circleWidth: 64,
          color: Colors.white),
    );
  }
}
