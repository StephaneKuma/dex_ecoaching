import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_coaching/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferBox extends StatefulWidget {
  const OfferBox({super.key});

  @override
  State<OfferBox> createState() => _OfferBoxState();
}

class _OfferBoxState extends State<OfferBox> {
  int current = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final containerHeight = size.height * 0.25;
    return SizedBox(
      height: containerHeight.h,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: containerHeight.h,
              autoPlay: true,
              viewportFraction: .9,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
            ),
            items: List.generate(
              5,
              (index) => Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 30.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/offer/background.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '25% de réduction*',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'sur le cours du jour',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Obtenez une réduction pour chaque commande de cours uniquement valable aujourd\'hui.!',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 6.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () => controller.animateToPage(index),
                  child: Container(
                    width: current == index ? 36.w : 12.w,
                    height: 12.h,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 4.w,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.r),
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(current == index ? 0.9 : 0.4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
