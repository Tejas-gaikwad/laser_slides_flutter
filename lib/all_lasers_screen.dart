import 'package:flutter/material.dart';
import 'add_laser_details_screen.dart';
import 'constants_colors.dart';
import 'dialog_box_widget.dart';
import 'laser_details.dart';

class AllLasersScreen extends StatefulWidget {
  const AllLasersScreen({super.key});

  @override
  State<AllLasersScreen> createState() => _AllLasersScreenState();
}

class _AllLasersScreenState extends State<AllLasersScreen> {
  int? selectedIndex;

  List<LaserProjectionModel> lasersProjectionsList = [
    LaserProjectionModel(
      laserProjectionName: 'Basic',
      laserProjectionImgLink: "assets/laser-images/laser-1.jpg",
    ),
    LaserProjectionModel(
      laserProjectionName: 'Astronaut',
      laserProjectionImgLink: "assets/laser-images/laser-2.jpg",
    ),
    LaserProjectionModel(
      laserProjectionName: 'Eagle',
      laserProjectionImgLink: "assets/laser-images/laser-3.jpg",
    ),
    LaserProjectionModel(
      laserProjectionName: 'Eagle-2',
      laserProjectionImgLink: "assets/laser-images/laser-4.jpg",
    ),
    LaserProjectionModel(
      laserProjectionName: 'Angel',
      laserProjectionImgLink: "assets/laser-images/laser-5.jpg",
    ),
    LaserProjectionModel(
      laserProjectionName: 'Angel-2',
      laserProjectionImgLink: "assets/laser-images/laser-6.jpg",
    ),
    LaserProjectionModel(
      laserProjectionName: 'Dolphin',
      laserProjectionImgLink: "assets/laser-images/laser-7.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyishColor,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AddLaserDetailsScreen();
            },
          ));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: primaryColor,
          ),
          child: const Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                'Add Laser',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Laser Slides',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'All Lasers : ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: lasersProjectionsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2, // Set the number of columns
                  crossAxisSpacing: 5.0, // Set the spacing between columns
                  mainAxisSpacing: 5.0, // Set the spacing between rows
                ),
                itemBuilder: (context, index) {
                  return button(index: index);
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget button({required int index}) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => FunkyOverlay(
            imgUrl: lasersProjectionsList[index].laserProjectionImgLink,
          ),
        );
      },
      onTap: () async {
        setState(() {
          selectedIndex = index;
        });

        await Future.delayed(const Duration(milliseconds: 500));

        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LaserDetailsScreen(
              laserData: lasersProjectionsList[index],
            );
          },
        ));
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        curve: Curves.bounceInOut,
        onEnd: () {
          setState(() {
            selectedIndex = -1;
          });
        },
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(
          top: selectedIndex == index ? 13 : 10,
          left: selectedIndex == index ? 13 : 10,
          right: selectedIndex == index ? 7 : 10,
          bottom: selectedIndex == index ? 7 : 10,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(4.0),
          color: greyishColor2,
          boxShadow: [
            BoxShadow(
              color: selectedIndex == index
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.grey,
              offset: const Offset(3.0, 3.0),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Image.asset(
                lasersProjectionsList[index].laserProjectionImgLink,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              lasersProjectionsList[index].laserProjectionName,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class LaserProjectionModel {
  final String laserProjectionName;
  final String laserProjectionImgLink;

  LaserProjectionModel({
    required this.laserProjectionName,
    required this.laserProjectionImgLink,
  });
}
