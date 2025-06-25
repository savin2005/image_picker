import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ImageUploadController extends ChangeNotifier {
  File? imageFile;
  String uploadStatus = "No Image";
  bool isUploading = false;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageFile = File(picked.path);
      uploadStatus = "Pending";
      notifyListeners();

      checkAndUpload();
    }
  }

  Future<void> checkAndUpload() async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none && imageFile != null) {
      uploadImage();
    }
  }

  Future<void> uploadImage() async {
    try {
      isUploading = true;
      uploadStatus = "Uploading...";
      notifyListeners();

      final uri = Uri.parse('https://httpbin.org/post');
      final request = http.MultipartRequest('POST', uri);
      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile!.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        uploadStatus = "Success";
        imageFile = null;
      } else {
        uploadStatus = "Failed";
      }
    } catch (e) {
      uploadStatus = "Failed";
    } finally {
      isUploading = false;
      notifyListeners();
    }
  }

  void retryUpload() {
    if (imageFile != null) {
      checkAndUpload();
    }
  }
}
