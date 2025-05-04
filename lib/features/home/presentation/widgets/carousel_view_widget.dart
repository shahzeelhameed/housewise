import 'package:flutter/material.dart';

class CarouselViewImages extends StatelessWidget {
  const CarouselViewImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 120, maxWidth: double.infinity),
      child: CarouselView(
          itemSnapping: true,
          itemExtent: double.infinity,
          children: [
            Image.asset(
              "assets/images/31.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/33.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/32.png",
              fit: BoxFit.cover,
            )
          ]),
    );
  }
}
