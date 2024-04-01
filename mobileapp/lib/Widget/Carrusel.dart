// ignore: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../Provider/Publicidad/PublicidadProvider.dart';

class CarrucelPublicidad extends StatefulWidget {
  const CarrucelPublicidad({super.key});

  @override
  State<CarrucelPublicidad> createState() => _CarrucelPublicidadState();
}

class _CarrucelPublicidadState extends State<CarrucelPublicidad> {
  @override
  void initState() {
    Provider.of<PublicidadProvider>(context, listen: false).getPublicidad();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PublicidadProvider>(context);
    final size = MediaQuery.of(context).size;

    return (provider.publicidad.isEmpty)
        ? Container(
            height: size.height * 0.25,
            child: SpinKitCircle(
              color: Color(0xffbf001e),
              size: 50.0,
            ),
          )
        : Container(
            height: size.height * 0.25,
            child: CarouselSlider.builder(
                itemCount: provider.publicidad.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(0, 1))
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                                provider.publicidad[itemIndex].url!),
                            fit: BoxFit.fill)),
                  );
                },
                options: CarouselOptions(
                    height: size.height * 0.25,
                    // aspectRatio: 8 / 10,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true)),
          );
  }
}
