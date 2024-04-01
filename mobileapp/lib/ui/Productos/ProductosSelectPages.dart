// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobileapp/Provider/Productos/ProductosProvider.dart';
import 'package:provider/provider.dart';

class ProductosSelectPages extends StatefulWidget {
  const ProductosSelectPages({super.key});

  @override
  State<ProductosSelectPages> createState() => _ProductosSelectPagesState();
}

class _ProductosSelectPagesState extends State<ProductosSelectPages> {
  @override
  void initState() {
    Provider.of<ProductosProvider>(context, listen: false).getProductos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.2),
            child: Container(
              color: Colors.blue,
            )),
        backgroundColor: Colors.white,
        body: (provider.productos.isEmpty)
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xffC81966),
                  size: 50.0,
                ),
              )
            : ListView.builder(
                itemCount: provider.productos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.black54, blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.30,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    provider.productos[index].url!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            // color: Colors.purple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.blue,
                                  width: size.width * 0.49,
                                  child: Text(
                                    maxLines: 2,
                                    provider.productos[index].producto!,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  // color: Colors.pink,
                                  alignment: Alignment.centerLeft,
                                  width: size.width * 0.49,
                                  height: size.height * 0.05,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    provider.productos[index].descripcion!,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: size.width * 0.49,
                                  height: 40,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Expanded(
                                      //     child: Container(
                                      //   padding: const EdgeInsets.all(5),
                                      //   height: 42,
                                      //   decoration: BoxDecoration(
                                      //       color: const Color(0xff1E8449),
                                      //       borderRadius:
                                      //           BorderRadius.circular(10)),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.center,
                                      //     children: [
                                      //       const Icon(
                                      //         Icons.add_shopping_cart,
                                      //         color: Colors.white,
                                      //       ),
                                      //       SizedBox(
                                      //         width: 5,
                                      //       ),
                                      //       Text('Comprar',
                                      //           style:
                                      //               GoogleFonts.plusJakartaSans(
                                      //             color: Colors.white,
                                      //           ))
                                      //     ],
                                      //   ),
                                      // )),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.green,
                                          alignment: Alignment.centerLeft,

                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            '\$ ${numberFormat(double.parse(provider.productos[index].valor1!))}',
                                            style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 22,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Color(0xff1E8449),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
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
