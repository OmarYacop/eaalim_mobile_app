import 'package:flutter/material.dart';

import 'beauty_container.dart';

class ActionBTN extends StatefulWidget {
  final void Function()? function;
  final void Function()? longPress;
  final dynamic prefixIcon;
  final String? text;
  final Color? textColor;
  double? width;
  double? height;
  double? iconPadding;
  double? fontSize = 15;
  bool? shadowless;
  FontWeight? fontWeight = FontWeight.normal;
  Color? bg;
  Widget? toggle;
  ActionBTN({
    Key? key,
    this.function,
    this.longPress,
    this.text,
    this.textColor,
    this.width,
    this.height,
    this.iconPadding,
    this.fontSize,
    this.fontWeight,
    this.prefixIcon,
    this.bg,
    this.toggle,
    this.shadowless,
  }) : super(key: key);

  @override
  State<ActionBTN> createState() => _ActionBTNState();
}

class _ActionBTNState extends State<ActionBTN> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isLongPressEnabled => widget.longPress != null;
  bool get isFunctionEnabled => widget.function != null;

  void _handleTapDown() {
    if (!isLongPressEnabled && isFunctionEnabled) {
      _controller.forward();
    }
  }

  void _handleTapUp() {
    if (!isLongPressEnabled && isFunctionEnabled) {
      _controller.reverse();
      widget.function!();
    }
  }

  void _handleLongPressUp() {
    if (isFunctionEnabled) {
      _controller.reverse();
      widget.function!();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    widget.width = widget.width ?? screenWidth * 27 / 37;
    widget.height = widget.height ?? screenHeight / 13;
    widget.iconPadding = widget.iconPadding ?? widget.width! * 6 / 40;

    return GestureDetector(
      onTapDown: (_) => _handleTapDown(),
      onTapUp: (_) => _handleTapUp(),
      onLongPress: () {
        if (isLongPressEnabled) {
          widget.longPress!();
        }
      },
      onLongPressUp: () => _handleLongPressUp(),
      child: beautyContainer(
        widget.height,
        width: widget.width!,
        backgroundColor: widget.bg,
        shadowless: widget.shadowless ?? true,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: widget.prefixIcon != null
                    ? widget.iconPadding!
                    : widget.width! * 0.26,
              ),
              child: widget.prefixIcon ?? const SizedBox(width: 0),
            ),
            SizedBox(
              width: widget.prefixIcon != null ? widget.width! * 6 / 40 : 0,
            ),
            widget.text != null
                ? Flexible(
                    child: Text(widget.text!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize,
                          fontWeight: widget.fontWeight,
                        )),
                  )
                : const SizedBox(),
            SizedBox(
              width: widget.toggle != null ? widget.width! * 0.23 : 0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: widget.toggle ?? const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
