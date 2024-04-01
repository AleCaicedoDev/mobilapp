// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileapp/Provider/Productos/ProductosProvider.dart';
import 'package:provider/provider.dart';

class ProductosSelectPages2 extends StatefulWidget {
  const ProductosSelectPages2({super.key});

  @override
  State<ProductosSelectPages2> createState() => _ProductosSelectPages2State();
}

class _ProductosSelectPages2State extends State<ProductosSelectPages2> {
  @override
  void initState() {
    Provider.of<ProductosProvider>(context, listen: false).getProductos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    final size = MediaQuery.of(context).size;

    List itemMap = [];
    if (provider.productos.isNotEmpty) {
      itemMap = provider.productos
          .map((e) => Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(color: Colors.black54, blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(e.url!), fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: size.width * 0.49,
                      height: size.height * 0.06,
                      child: Text(
                        maxLines: 2,
                        e.producto!,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.green,
                      alignment: Alignment.centerRight,
                      width: size.width * 0.49,
                      height: size.height * 0.03,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        '\$ ${numberFormat(double.parse(e.valor1!))}',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 42,
                          decoration: BoxDecoration(
                              color: const Color(0xff1E8449),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Comprar',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 50,
                          height: 42,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList();
    } else {
      itemMap = [
        const Center(
          child: SpinKitThreeBounce(
            color: Color(0xffbf001e),
            size: 50.0,
          ),
        )
      ];
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: (provider.productos.isEmpty)
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xffbf001e),
                  size: 50.0,
                ),
              )
            : Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  childAspectRatio: (100 / 150),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  children: [...itemMap],
                ),
              ),
      ),
    );
  }

  String numberFormat(double x) {
    List<String> parts = x.toString().split('.');
    RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

    parts[0] = parts[0].replaceAll(re, ',');
    if (parts.length == 1) {
      parts.add('00');
    } else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 0);
    }
    return parts.join('');
  }
}
