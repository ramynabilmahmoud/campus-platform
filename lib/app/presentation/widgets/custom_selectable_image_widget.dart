import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomSelectableImageWidget extends StatefulWidget {
  const CustomSelectableImageWidget(
      {super.key,
      this.imageUrl,
      this.radius = 0,
      this.width,
      this.height,
      this.data,
      this.image,
      this.onTap});

  final void Function()? onTap;
  final String? imageUrl;
  final Uint8List? data;
  final File? image;
  final double radius;
  final double? width;
  final double? height;

  @override
  State<CustomSelectableImageWidget> createState() =>
      _CustomSelectableImageWidgetState();
}

class _CustomSelectableImageWidgetState
    extends State<CustomSelectableImageWidget> {
  bool _over = false;
  String image = '';

  @override
  void initState() {
    super.initState();
    image = widget.imageUrl ?? "";
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        onHover: (over) {
          setState(() {
            _over = over;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: Stack(
            children: [
              SizedBox(
                  width: widget.width ?? double.infinity,
                  height: widget.height ?? double.infinity,
                  child: widget.image != null
                      ? (kIsWeb
                          ? Image.network(widget.image!.path, fit: BoxFit.cover)
                          : Image.file(widget.image!, fit: BoxFit.cover))
                      : widget.data != null
                          ? Image.memory(widget.data!, fit: BoxFit.cover)
                          : image.isEmpty
                              ? Container(
                                  color: theme.colorScheme.surfaceVariant)
                              : image.startsWith("http")
                                  ? Image.network(
                                      image,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      image,
                                      fit: BoxFit.cover,
                                    )),
              if (_over)
                Positioned.fill(
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      color: const Color(0x66000000),
                      child: const Center(
                          child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ))),
                ),
            ],
          ),
        ));
  }
}
