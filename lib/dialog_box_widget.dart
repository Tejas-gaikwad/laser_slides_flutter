import 'package:flutter/material.dart';

import 'constants_colors.dart';

class FunkyOverlay extends StatefulWidget {
  final String imgUrl;

  const FunkyOverlay({
    super.key,
    required this.imgUrl,
  });
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  bool selected = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 320));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Play the Laser",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                      child: Image.asset(
                        widget.imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: GestureDetector(
                      // onLongPress: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => FunkyOverlay(),
                      //   );
                      // },
                      onTap: () {
                        setState(() {
                          selected = true;
                        });
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        curve: Curves.bounceInOut,
                        onEnd: () {
                          setState(() {
                            selected = false;
                          });
                        },
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.only(
                          top: selected ? 13 : 10,
                          left: selected ? 13 : 10,
                          right: selected ? 7 : 10,
                          bottom: selected ? 7 : 10,
                        ),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(4.0),
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: selected
                                  ? Colors.grey.withOpacity(0.2)
                                  : Colors.grey,
                              offset: const Offset(3.0, 3.0),
                              blurRadius: 1,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: const Text(
                          "BTN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
