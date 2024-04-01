// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileapp/Provider/Categorias/CategoriasProvider.dart';
import 'package:mobileapp/Widget/Carrusel.dart';
import 'package:provider/provider.dart';

import '../../Provider/Productos/ProductosProvider.dart';

class PrincipalPages extends StatelessWidget {
  const PrincipalPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          const CarrucelPublicidad(),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              'Tipos de carnes',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.red,
              ),
            ),
          ),
          Categoria(size: size),
        ],
      ),
    );
  }
}

class Categoria extends StatefulWidget {
  const Categoria({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<Categoria> createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  @override
  void initState() {
    Provider.of<CategoriasProvider>(context, listen: false).getCategorias();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoriasProvider>(context);
    final productosProvider = Provider.of<ProductosProvider>(context);
    List itemMap = [];
    if (provider.categoria.isNotEmpty) {
      itemMap = provider.categoria
          .map(
            (e) => InkWell(
              onTap: () {
                productosProvider.isIdSelectCategoria = e.id!;
                productosProvider.isSelectCategoria = e.categoria!;
                Navigator.pushNamed(context, 'ProductosSelectPages2');
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                width: widget.size.width,
                height: widget.size.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(e.url!), fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10),
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: NetworkImage(e.icon!))),
                      ),
                      Text(
                        '${e.categoria!}',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList();
    } else {
      itemMap = [
        const Center(
          child: SpinKitCircle(
            color: Color(0xffbf001e),
            size: 50.0,
          ),
        )
      ];
    }
    return Column(
      children: [
        ...itemMap,
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
