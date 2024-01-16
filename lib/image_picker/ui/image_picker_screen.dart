// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:counter_app/image_picker/bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
                return state.imageFile == null
                    ? InkWell(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(CameraCapture());
                        },
                        child: CircleAvatar(
                          radius: 100,
                          child: const Icon(Icons.person),
                        ),
                      )
                    : CircleAvatar(
                        radius: 100,
                        child: Image.file(
                          File(state.imageFile!.path),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const Text('Camera'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(GalleryImagePicker());
                  },
                  child: const Text('Gallery'),
                ),
              ],
            ),
          ]),
    );
  }
}
