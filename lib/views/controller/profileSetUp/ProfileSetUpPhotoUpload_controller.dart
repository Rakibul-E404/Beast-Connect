import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetUpPhotoUploadController extends ChangeNotifier {
  final int maxImages = 6;
  final ImagePicker _picker = ImagePicker();

  // List to store picked images as File objects
  List<File?> images = List.generate(6, (index) => null);

  Future<void> pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images[index] = File(pickedFile.path);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    images[index] = null;
    notifyListeners();
  }

  bool get hasAtLeastOneImage => images.any((img) => img != null);
}
