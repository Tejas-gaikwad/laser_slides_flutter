// import 'package:flutter/material.dart';

// class NeoPopButton extends StatelessWidget {
//   const NeoPopButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: AnimatedContainer(
//         curve: Curves.bounceInOut,
//         onEnd: () {
//           setState(() {
//             selectedIndex = -1;
//           });
//         },
//         duration: const Duration(milliseconds: 200),
//         margin: EdgeInsets.only(
//           top: selectedIndex == index ? 20 : 10,
//           left: selectedIndex == index ? 20 : 10,
//         ),
//         height: 80,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.white,
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(3.0, 3.0),
//               blurRadius: 4,
//               spreadRadius: 1,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
