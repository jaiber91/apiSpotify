import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../providers/university_provider.dart';

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({super.key});

  Future<Uint8List?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return await pickedFile.readAsBytes();
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageData = ref.watch(selectedImageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            final image = await _pickImage();
            if (image != null) {
              ref.read(selectedImageProvider.notifier).state = image;
            }
          },
          child: const Text('Seleccionar imagen'),
        ),
        const SizedBox(height: 12),
        if (imageData != null)
          Image.memory(
            imageData,
            height: 150,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}
