import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

class IdentityImageUploader extends StatefulWidget {
  const IdentityImageUploader(
      {super.key, required this.label, this.error, this.onImageChanged});

  final String label;
  final String? error;
  final void Function(XFile? image)? onImageChanged;

  @override
  State<IdentityImageUploader> createState() => _IdentityImageUploader();
}

class _IdentityImageUploader extends State<IdentityImageUploader> {
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DottedBorder(
        borderType: BorderType.RRect,
        color: theme.colorScheme.outline,
        strokeWidth: 1,
        dashPattern: const [5, 0, 5],
        radius: const Radius.circular(12),
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.error == null
                          ? (_imagePath != null && !kIsWeb
                              ? Text(
                                  _imagePath!,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Text(widget.label))
                          : Text(widget.error!,
                              style: TextStyle(color: theme.colorScheme.error)),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onTap: () {
                              if (!kIsWeb) {
                                showCustomDialog(
                                    context: context,
                                    dismissable: true,
                                    content: [
                                      const Center(
                                          child: Text(
                                        "Choose image source",
                                        style: TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ))
                                    ],
                                    actions: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FilledButton(
                                              onPressed: () {
                                                _selectImage(true);
                                              },
                                              child: Text("Gallery")),
                                          const SizedBox(width: 10),
                                          FilledButton(
                                              onPressed: () {
                                                _selectImage(false);
                                              },
                                              child: Text("Camera")),
                                        ],
                                      ),
                                    ]);
                              } else {
                                _selectImage(true);
                              }
                            },
                            child: _imagePath != null
                                ? (kIsWeb
                                    ? Image.network(_imagePath!,
                                        width: 100,
                                        height: double.infinity,
                                        fit: BoxFit.fitWidth)
                                    : Image.file(File(_imagePath!),
                                        width: 100,
                                        height: double.infinity,
                                        fit: BoxFit.fitWidth))
                                : Container(
                                    width: 100,
                                    height: double.infinity,
                                    color: theme.colorScheme.outlineVariant,
                                  ),
                          )),
                      if (_imagePath != null)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: theme.colorScheme.error,
                            child: IconButton(
                              icon: Icon(Icons.close,
                                  size: 15, color: theme.colorScheme.onError),
                              onPressed: () {
                                setState(() {
                                  _imagePath = null;
                                  if (widget.onImageChanged != null) {
                                    widget.onImageChanged!(null);
                                  }
                                });
                              },
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            )));
  }

  void _selectImage(bool gallery) {
    _picker
        .pickImage(
            source: gallery ? ImageSource.gallery : ImageSource.camera,
            imageQuality: 80)
        .then((value) {
      if (widget.onImageChanged != null) {
        widget.onImageChanged!(value);
      }

      setState(() {
        _imagePath = value?.path;
      });
    });
  }
}
