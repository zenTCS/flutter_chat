import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertOptions(
  BuildContext context, {
  required String msg,
  required String title,
  void Function()? acceptOnPressed,
  void Function()? cancelOnPressed,
  void Function()? closeOnPressed,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: CupertinoAlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Text(msg),
          actions: (acceptOnPressed != null || cancelOnPressed != null)
          ? [ (cancelOnPressed != null)
                ? CupertinoDialogAction(
                  onPressed: cancelOnPressed,
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.black),
                  ),
                )
                : const SizedBox.shrink(),
              (acceptOnPressed != null)
                ? CupertinoDialogAction(
                  onPressed: acceptOnPressed,
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.black),
                  ),
                )
                : const SizedBox.shrink(),
          ]
          : [
            CupertinoDialogAction(
              onPressed: (closeOnPressed != null) ? closeOnPressed : () => Navigator.of(context).pop(),
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.black),
              ),
            )
          ]
        ),
      );
    },
  );
}
