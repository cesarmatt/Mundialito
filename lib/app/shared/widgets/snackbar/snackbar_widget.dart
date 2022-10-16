import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar makeSuccessSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.greenAccent,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
}

SnackBar makeErrorSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.redAccent,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
}

SnackBar makeLoadingSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.blueAccent,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
}