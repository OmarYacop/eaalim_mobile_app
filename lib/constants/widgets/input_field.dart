import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import 'beauty_container.dart';

Widget inputField(
  IconData? prefixIcon,
  double width,
  String? labelText,
  TextEditingController? controller, {
  Color? bg,
  bool hideText = false,
  int maxLines = 1,
  TextInputAction textInputAction = TextInputAction.done,
  String hint = '',
  Color hintColor = Colors.black,
  bool autoFocus = false,
  void Function()? onChanged,
}) {
  final ValueNotifier<TextDirection> textDir = ValueNotifier(TextDirection.ltr);
  final ValueNotifier<bool> obscureNotifier = ValueNotifier(hideText);

  return ValueListenableBuilder<bool>(
    valueListenable: obscureNotifier,
    builder: (context, obscure, child) => ValueListenableBuilder<TextDirection>(
      valueListenable: textDir,
      builder: (context, value, child) => beautyContainer(
        null,
        width: width,
        backgroundColor: bg,
        boxShadowValue: 0.5,
        child: TextField(
          controller: controller,
          textDirection: value,
          cursorColor: hintColor,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: maxLines,
          textInputAction: textInputAction,
          obscureText: obscure,
          autofocus: autoFocus,
          onChanged: (input) {
            if (input.trim().length < 2) {
              final dir = getDirection(input);
              if (dir != value) textDir.value = dir;
            }
            onChanged != null ? onChanged() : () {};
          },
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: hintColor),
          decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: hintColor,
                    )
                  : const SizedBox(width: 0),
              prefixIconColor: Colors.black,
              suffixIcon: hideText
                  ? IconButton(
                      icon: obscure
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        obscureNotifier.value = !obscureNotifier.value;
                      },
                    )
                  : const SizedBox(width: 0),
              label: labelText != null
                  ? Text(
                      labelText,
                      style: TextStyle(color: AppColors.primary),
                    )
                  : null,
              hintText: hint,
              hintStyle: TextStyle(color: hintColor),
              border: InputBorder.none),
        ),
      ),
    ),
  );
}

TextDirection getDirection(String v) {
  final string = v.trim();
  if (string.isEmpty) return TextDirection.ltr;
  final firstUnit = string.codeUnitAt(0);
  if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
      firstUnit > 0x0750 && firstUnit < 0x077F ||
      firstUnit > 0x07C0 && firstUnit < 0x07EA ||
      firstUnit > 0x0840 && firstUnit < 0x085B ||
      firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
      firstUnit > 0x08E3 && firstUnit < 0x08FF ||
      firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
      firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
      firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
      firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
      firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
      firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
      firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
      firstUnit > 0x10800 && firstUnit < 0x10805 ||
      firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
      firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
      firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
      firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
      firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
      firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
      firstUnit > 0x1D242 && firstUnit < 0x1D244) {
    return TextDirection.rtl;
  }
  return TextDirection.ltr;
}
