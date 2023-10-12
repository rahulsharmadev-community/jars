import 'package:flutter/material.dart';

class SlideMenuButton<T extends Widget> extends StatelessWidget {
  final T value;
  final SlideMenu<T> slideMenu;
  final bool barrierDismissible;
  final bool overlap;
  const SlideMenuButton({
    super.key,
    required this.value,
    required this.slideMenu,
    this.barrierDismissible = true,
    this.overlap = false,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey<ScaffoldState>();
    return GestureDetector(
        onTap: () => showDialog(
            context: context,
            barrierColor: Colors.transparent,
            barrierDismissible: barrierDismissible,
            builder: (context) {
              var offset =
                  (globalKey.currentContext!.findRenderObject() as RenderBox)
                      .localToGlobal(Offset.zero);
              return Stack(
                children: [
                  Positioned(
                      left: offset.dx,
                      top: offset.dy - (overlap ? slideMenu.size : 0),
                      child: slideMenu),
                ],
              );
            }),
        child: SizedBox.square(
          key: globalKey,
          dimension: 42,
          child: Center(child: value),
        ));
  }
}

class SlideMenu<T extends Widget> extends StatefulWidget {
  final Duration duration;
  final double size;
  final BorderRadius borderRadius;
  final int initalIndex;
  final Function(int index) onSelected;
  final List<T> items;

  final Color? selectedTileColor, unSelectedTileColor, background;
  SlideMenu(
      {super.key,
      this.size = 42,
      this.duration = const Duration(milliseconds: 300),
      BorderRadius? borderRadius,
      required this.items,
      required this.initalIndex,
      required this.onSelected,
      this.selectedTileColor,
      this.unSelectedTileColor,
      this.background})
      : borderRadius = borderRadius ?? BorderRadius.circular(100);

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late int initalIndex;
  late AnimationController controller;
  double get value => controller.value;
  @override
  void initState() {
    super.initState();
    initalIndex = widget.initalIndex;
    controller = AnimationController(duration: widget.duration, vsync: this)
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    final background =
        widget.background ?? Theme.of(context).dialogBackgroundColor;
    return MediaQuery.removeViewInsets(
      context: context,
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Material(
              clipBehavior: Clip.hardEdge,
              color: background,
              // type: MaterialType.transparency,
              shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
              child: SizedBox(
                width: widget.size,
                height: value * widget.items.length * widget.size,
                child: OverflowBar(children: [
                  for (int i = 0; i < widget.items.length; i++)
                    button(
                      index: i,
                      onTap: () {
                        initalIndex = i;
                        widget.onSelected(initalIndex);
                        controller
                            .reverse()
                            .whenComplete(() => Navigator.pop(context));
                      },
                    )
                ]),
              ),
            );
          }),
    );
  }

  InkResponse button({
    required int index,
    double? width,
    double? height,
    required VoidCallback? onTap,
  }) {
    final selectedTileColor =
        widget.selectedTileColor ?? Theme.of(context).primaryColor;
    final unSelectedTileColor =
        widget.unSelectedTileColor ?? Theme.of(context).disabledColor;
    return InkResponse(
      onTap: onTap,
      child: Container(
        width: width ?? widget.size,
        height: height ?? widget.size,
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color:
                index == initalIndex ? selectedTileColor : unSelectedTileColor,
            borderRadius: widget.borderRadius),
        child: Center(child: widget.items[index]),
      ),
    );
  }
}
