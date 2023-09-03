import 'package:flutter/material.dart';
import 'package:jars/core/src/extensions/library_extensions.dart';

class FloatingTextField extends StatefulWidget {
  final bool hideCloseButton;
  final String hintText;
  final Color? color;
  final Duration duration;
  final FocusNode focusNode;
  final BorderRadius borderRadius;
  final Widget suffix;
  final double? suffixSize;
  final VoidCallback onSuffix;
  final TextEditingController textController;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  FloatingTextField({
    super.key,
    this.duration = const Duration(milliseconds: 300),
    this.hintText = 'Search...',
    this.color,
    BorderRadius? borderRadius,
    FocusNode? focusNode,
    TextEditingController? textController,
    this.hideCloseButton = false,
    this.onSubmitted,
    this.onChange,
    this.suffix = const Icon(Icons.cleaning_services_rounded),
    this.suffixSize = 22,
    required this.onSuffix,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(16),
        focusNode = focusNode ?? FocusNode(),
        textController = textController ?? TextEditingController();

  @override
  State<FloatingTextField> createState() => _FloatingTextFieldState();
}

class _FloatingTextFieldState extends State<FloatingTextField>
    with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        if (animController.value == 1) {
          widget.focusNode.requestFocus();
        }
      });
  }

  @override
  void dispose() {
    animController.dispose();
    widget.focusNode.dispose();
    widget.textController.dispose();
    super.dispose();
  }

  bool get isOpen => animController.value != 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animController,
      builder: (context, child) {
        var width = animController.value * MediaQuery.of(context).size.width;
        var inputBorder = OutlineInputBorder(
            borderRadius: widget.borderRadius,
            borderSide: BorderSide(color: context.theme.primaryColor));
        return Container(
          height: kToolbarHeight,
          width: width > kToolbarHeight ? width : kToolbarHeight,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: widget.color ?? context.theme.colorScheme.outlineVariant,
            borderRadius: widget.borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isOpen)
                Expanded(
                    child: TextField(
                  controller: widget.textController,
                  focusNode: widget.focusNode,
                  onEditingComplete: () => animController.reverse(),
                  onSubmitted: widget.onSubmitted,
                  onChanged: widget.onChange,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: inputBorder,
                      enabledBorder: inputBorder,
                      focusedBorder: inputBorder,
                      errorBorder: inputBorder,
                      disabledBorder: inputBorder,
                      focusedErrorBorder: inputBorder,
                      suffixIcon: animController.isAnimating
                          ? null
                          : IconButton(
                              enableFeedback: true,
                              onPressed: () {
                                widget.onSuffix();
                                widget.textController.clear();
                                setState(() {});
                              },
                              iconSize: widget.suffixSize,
                              icon: widget.suffix)),
                )),
              if (!isOpen || !widget.hideCloseButton) dynamicSearchButton()
            ],
          ),
        );
      },
    );
  }

  IconButton dynamicSearchButton() {
    return IconButton(
        onPressed: () {
          if (animController.isAnimating) return;
          if (animController.value == 1) {
            animController.reverse();
          } else {
            animController.forward();
          }
        },
        icon: Icon(isOpen ? Icons.close_rounded : Icons.search));
  }
}
