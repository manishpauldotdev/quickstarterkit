import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

Future<void> commonModal(
  BuildContext context, {
  required Widget child,
  Color backgroundColor = AppColors.colorWhite,
  EdgeInsets? padding,
}) async {
  return showModalBottomSheet<dynamic>(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.verticalSpace,
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 68.r,
              width: 68.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.colorBlack.withOpacity(0.5),
              ),
              child: const Center(
                child: Icon(
                  Icons.close,
                  color: AppColors.colorWhite,
                ),
              ),
            ),
          ),
          20.verticalSpace,
          AnimatedPadding(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Container(
                    padding: padding,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
