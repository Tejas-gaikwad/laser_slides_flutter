import 'package:flutter/material.dart';

import 'all_lasers_screen.dart';
import 'constants_colors.dart';

class LaserDetailsScreen extends StatefulWidget {
  final LaserProjectionModel laserData;
  const LaserDetailsScreen({super.key, required this.laserData});

  @override
  State<LaserDetailsScreen> createState() => _LaserDetailsScreenState();
}

class _LaserDetailsScreenState extends State<LaserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyishColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        title: const Text(
          'Laser Slides',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              widget.laserData.laserProjectionName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Hero(
              tag: 'laserImage',
              transitionOnUserGestures: true,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 20,
                      spreadRadius: 1,
                    )
                  ],
                ),
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Image.asset(
                      widget.laserData.laserProjectionImgLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Play Laser',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
