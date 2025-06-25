import 'package:flutter/material.dart';
import 'package:offline_image_upload/Provider/image_uploadcontroller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImageUploadController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Offline Upload")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.imageFile != null)
              Image.file(provider.imageFile!,
                  width: 200, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text("Status: ${provider.uploadStatus}"),
            if (provider.uploadStatus == "Failed")
              ElevatedButton(
                onPressed: provider.retryUpload,
                child: const Text("Retry"),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: provider.pickImage,
              child: const Text("Pick Image"),
            ),
          ],
        ),
      ),
    );
  }
}
