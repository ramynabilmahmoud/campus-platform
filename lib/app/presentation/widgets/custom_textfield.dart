import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  static const TextStyle style =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w300);
  const CustomTextField(
      {super.key,
      this.label,
      this.hint,
      this.helper,
      this.prefixIcon,
      this.validator,
      this.type = TextInputType.text,
      this.onChange,
      this.formatters = const <TextInputFormatter>[],
      this.isObscure = false,
      this.isDense = false,
      this.borderRadius = 10,
      this.isLoading = false,
      this.error,
      this.value,
      this.suffixIcon,
      this.controller,
      this.width,
      this.height,
      this.maxChar,
      this.minLines,
      this.maxLines});

  final int? minLines;
  final int? maxLines;
  final int? maxChar;
  final String? label;
  final double? width;
  final double? height;
  final String? hint;
  final String? helper;
  final IconData? prefixIcon;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> formatters;
  final TextInputType type;
  final double borderRadius;
  final bool isDense;
  final bool isObscure;
  final String? value;
  final String? error;
  final bool isLoading;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextField();
}

class _CustomTextField extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          if (widget.label != null)
            SizedBox(
              child: Text(widget.label!,
                  style: widget.error != null
                      ? theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.error)
                      : theme.textTheme.bodyLarge),
            ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      Stack(children: [
        TextFormField(
          style: CustomTextField.style,
          autofocus: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.formatters,
          validator: widget.validator,
          controller: widget.controller,
          maxLength: widget.maxChar,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          keyboardType: widget.type,
          onChanged: widget.onChange,
          decoration: InputDecoration(
              isDense: widget.isDense,
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      color: theme.colorScheme.outlineVariant, width: 1)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      color: theme.colorScheme.outline.withOpacity(0.5),
                      width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      color: theme.colorScheme.outlineVariant, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide:
                      BorderSide(color: theme.colorScheme.primary, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide:
                      BorderSide(color: theme.colorScheme.error, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide:
                      BorderSide(color: theme.colorScheme.error, width: 1)),
              // labelText: widget.label,
              errorMaxLines: 3,
              errorText: widget.error,
              prefixIcon:
                  widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              suffixIcon:
                  widget.isObscure ? _createTogglePasswordButton() : null,
              helperText: widget.helper,
              helperMaxLines: 3,
              helperStyle: theme.textTheme.bodySmall,
              hintText: widget.hint,
              hintStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
          obscureText: widget.isObscure ? _obscure : false,
          initialValue: widget.value,
        ),
        if (widget.isLoading)
          Positioned.directional(
              top: 15,
              end: 15,
              textDirection: Directionality.of(context),
              child: SizedBox(
                width: 20,
                height: 20,
                child:
                    CircularProgressIndicator(color: theme.colorScheme.primary),
              )),
      ]),
      const SizedBox(height: 5),
      // if (widget.helper != null || widget.error != null)
      //   SizedBox(
      //     child: Text(
      //       widget.error ?? widget.helper!,
      //       softWrap: true,
      //       maxLines: 3,
      //       style: widget.error != null
      //           ? theme.textTheme.bodySmall!
      //               .copyWith(color: theme.colorScheme.error)
      //           : theme.textTheme.bodySmall,
      //     ),
      //   ),
    ]);
  }

  Widget _createTogglePasswordButton() {
    return Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: IconButton(
            icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            }));
  }
}
