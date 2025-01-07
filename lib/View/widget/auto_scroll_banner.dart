import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trekntread/Model/banner.dart';


class AutoScrollBanner extends StatelessWidget {
  final List<BannerImage> banners;

  const AutoScrollBanner({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: banners.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  banner.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}


//  F I X E D      F I L E S-------------->











// import 'dart:async';

// import 'package:flutter/material.dart';

// class AutoScrollBanner extends StatefulWidget {
//   final List<String> bannerImages;
  
//   const AutoScrollBanner({
//     Key? key,
//     required this.bannerImages,
//   }) : super(key: key);

//   @override
//   State<AutoScrollBanner> createState() => _AutoScrollBannerState();
// }

// class _AutoScrollBannerState extends State<AutoScrollBanner> {
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
//       if (_currentPage < widget.bannerImages.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: PageView.builder(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             itemCount: widget.bannerImages.length,
//             itemBuilder: (context, index) {
//               return Image.network(
//                 widget.bannerImages[index],
//                 fit: BoxFit.cover,
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             widget.bannerImages.length,
//             (index) => Container(
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               width: 8,
//               height: 8,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _currentPage == index ? Colors.white : Colors.white.withOpacity(0.5),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }