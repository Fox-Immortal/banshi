import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:panshi/constant/my_colors.dart';

class PagesSlider extends StatefulWidget {
  final double width, height;
  final List<String> photo;
  final Color color;
  const PagesSlider(
      {Key? key,
      required this.width,
      required this.height,
      required this.photo,
      required this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PagesSliderState();
  }
}

class PagesSliderState extends State<PagesSlider> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: widget.height * 0.5,
          padding: const EdgeInsets.all(4),
          child: CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                height: widget.height * 0.49,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                aspectRatio: 2.0,
                onPageChanged: (index, butt) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: widget.photo.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(context,MaterialPageRoute(builder:(context){return  OpenCover(src: e);},),);
                    },
                    child: Container(
                      width: widget.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(e), fit: BoxFit.cover)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.photo, (index, url) {
            return Container(
              height: 8.0,
              width: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? MyColors.myOrange : widget.color),
            );
          }),
        ),
      ],
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}
