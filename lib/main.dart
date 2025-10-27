import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CarouselExample(),
    );
  }
}

class CarouselExample extends StatelessWidget {
  const CarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    // List of images (you can replace with your own URLs or assets)
    final List<String> imageList = [
      'https://picsum.photos/id/1015/400/200',
      'https://picsum.photos/id/1016/400/200',
      'https://picsum.photos/id/1025/400/200',
      'https://picsum.photos/id/1035/400/200',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel View Example'),
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            viewportFraction: 0.8,
          ),
          items: imageList.map((item) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black26,
                    child: Text(
                      "Image from Picsum",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
