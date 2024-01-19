import 'package:flutter/material.dart';
import 'package:get/get.dart';

void openDialog() {
  Get.dialog(
    AlertDialog(
      title: const Text('Dialog'),
      content: const Text('This is a dialog'),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Get.back(),
        ),
      ],
    ),
  );
}
