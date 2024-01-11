import 'package:flutter/material.dart';

import 'constants_colors.dart';
import 'dialog_box_widget.dart';

class AllLasersScreen extends StatefulWidget {
  const AllLasersScreen({super.key});

  @override
  State<AllLasersScreen> createState() => _AllLasersScreenState();
}

class _AllLasersScreenState extends State<AllLasersScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Laser Slides',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Set the number of columns
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
      ),
    );
  }

  Widget button({required int index}) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => FunkyOverlay(),
        );
      },
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
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
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
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
        child: Text("BTN"),
      ),
    );
  }
}
