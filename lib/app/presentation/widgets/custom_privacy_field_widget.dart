import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomPrivacyFieldWidget extends StatelessWidget {
  const CustomPrivacyFieldWidget({
    super.key,
    required this.title,
    required this.description,
    this.onChanged,
    this.enabled = false,
  });

  final String title;
  final String description;
  final bool enabled;

  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                description.tr(),
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: enabled,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
