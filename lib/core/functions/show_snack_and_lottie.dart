import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nabd/core/util/colors.dart';

showsSnackBar({required context, required text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: color ?? AppColors.primaryColor,
      content: Text(text),
    ),
  );
}

// showLoading({required context}) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return Center(
//         child: SizedBox(
//           height: 250,
//           width: 250,
//           child: Lottie.asset(
//             'assets/riv/loading_book.riv',
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
//     },
//   );
// }

showLottieDialog({required context, required String lottieAsset}) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Lottie.asset(lottieAsset),
        ),
      );
    },
  );
}
