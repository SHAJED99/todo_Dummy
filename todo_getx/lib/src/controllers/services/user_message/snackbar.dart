import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_getx/components.dart';

Future<void> showSnackBar({
  required String title,
  required String message,
  Widget? icon,
  SnackPosition snackPosition = SnackPosition.TOP,
  void Function(SnackbarStatus? status)? snackbarStatus,
  TextButton? mainButton,
  Duration duration = const Duration(seconds: 5),
  Duration? animationDuration,
  Completer<void>? completer,
  EdgeInsets? padding,
  EdgeInsets? margin,
  Widget? child,
}) async {
  final Completer<void> c = completer ?? Completer<void>();
  if (Get.isSnackbarOpen) Get.closeAllSnackbars();

  final t = Get.theme;

  Get.snackbar(
    title,
    message,
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message, style: t.textTheme.bodyMedium?.copyWith(color: t.colorScheme.onBackground)),
        if (child != null)
          Padding(
            padding: EdgeInsets.only(top: defaultPadding / 4),
            child: child,
          )
      ],
    ),
    icon: icon,
    borderRadius: defaultPadding / 2,
    padding: padding ?? EdgeInsets.all(defaultPadding),
    margin: margin ?? EdgeInsets.all(defaultPadding),
    snackPosition: snackPosition,
    snackbarStatus: (status) async {
      if (snackbarStatus != null) snackbarStatus(status);
      if (status == SnackbarStatus.CLOSED && !c.isCompleted) {
        await Future.delayed(const Duration(milliseconds: 100));
        c.complete();
      }
    },
    colorText: t.colorScheme.onPrimaryContainer,
    maxWidth: maxBoxWidth,
    backgroundColor: t.colorScheme.primaryContainer.withOpacity(0.7),
    mainButton: mainButton,
    duration: duration,
    animationDuration: animationDuration,
  );

  await c.future;
}

void showToast({String? title, required String message}) {
  bool isAndroid = (Platform.isAndroid || kIsWeb);
  bool isIOS = Platform.isIOS;
  bool isWeb = kIsWeb;

  if (isAndroid || isIOS || isWeb) {
    Fluttertoast.showToast(msg: "${title == null ? "" : "$title:"} $message", toastLength: Toast.LENGTH_LONG);
  } else {
    showSnackBar(title: title ?? "", message: message);
  }
}

Future<bool> showConfirmationMessage({
  required String heading,
  required String message,
  Completer<void>? completer,
}) async {
  bool res = true;
  await showSnackBar(
    completer: completer,
    animationDuration: const Duration(milliseconds: 100),
    icon: const Icon(Icons.info),
    title: heading,
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding),
    mainButton: TextButton(
      onPressed: () {
        res = false;
        Get.closeCurrentSnackbar();
      },
      child: const Text(
        "Undo",
        style: TextStyle(color: Colors.green),
      ),
    ),
  );

  return res;
}
