import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/pages/widgets/custom_button_widget.dart';
import 'package:weather_app/pages/widgets/custom_loading_widget.dart';

class UiHelper {
  UiHelper._();
  static UiHelper uiHelper = UiHelper._();

  showMessage({required String message}) {
    Flushbar(
      messageText: Center(
        child: Text(
          message,
          style: Theme.of(RouteHelper.routeHelper.navKey.currentContext!)
              .textTheme
              .headline1!
              .copyWith(
                color: kWhiteColor,
              ),
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: kBlackColor.withOpacity(0.81),
      duration: const Duration(seconds: 3),
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
    ).show(RouteHelper.routeHelper.navKey.currentContext!);
  }

// close keyboard
  closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // print Date
  String printDate(DateTime dateTime, {String? format}) {
    DateFormat dateFormat = DateFormat(format ?? "yyyy-MM-dd");
    String date = dateFormat.format(dateTime);
    return date;
  }

  // start dialog message
  showDialogMessage({
    required String message,
    String? title,
    String? buttonTitle,
    IconData? icon,
    Color? iconColor,
    required Function() onTap,
  }) {
    showDialog(
      context: RouteHelper.routeHelper.navKey.currentContext!,
      builder: (context) => Dialog(
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon ?? Icons.check_circle_rounded,
                color: iconColor ?? Colors.green,
                size: 60.r,
              ),
              SizedBox(height: 10.h),
              (title != null)
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                  : const SizedBox.shrink(),
              (title != null) ? SizedBox(height: 6.h) : const SizedBox.shrink(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(height: 20.h),
              CustomButtonWidget(
                title: buttonTitle ?? 'Ok',
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

// disable on will pop
  Future<bool> disableOnWillPop() async {
    return false;
  }

  // start dialog loading
  startLoadingDialog() {
    showDialog(
      context: RouteHelper.routeHelper.navKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 130.h,
            height: 130.h,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: CustomLoadingWidget(
                size: 55.h,
              ),
            ),
          ),
        ),
      ),
    );
  }

// close loading dialog
  stopLoadingDialog() {
    // close dialog
    Navigator.of(RouteHelper.routeHelper.navKey.currentContext!,
            rootNavigator: true)
        .pop();
  }
}
