// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<String> imgList = [
  "lib/assets/flutter_logo.svg",
  "lib/assets/trainer.svg",
  "lib/assets/gym.svg"

]; 

void main() => runApp(CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo Home Page"),
          centerTitle: true,
        ),
        body: FullscreenSliderDemo()),
        );
      },
      valueListenable: themeMode,
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          //final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: 500,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
  
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: SvgPicture.asset(
                        item,
                        width: 500,

                        //fit:BoxFit.cover,
                        //height: height,
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}



