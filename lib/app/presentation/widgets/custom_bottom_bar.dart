import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomBottomBarStyle {
  final Color activeColor;
  final Color activeIconColor;

  const CustomBottomBarStyle(
      {this.activeColor = const Color(0x2C367FF4),
      this.activeIconColor = const Color(0xFF629BF7)});
}

class CustomBottomBarItem {
  final void Function()? onTap;
  final IconData icon;
  final String label;
  final IconData activation;
  final List<String> roles;
  final PageRouteInfo? route;
  final IconData? activeIcon;

  const CustomBottomBarItem({
    required this.icon,
    required this.label,
    this.roles = const [],
    this.activeIcon,
    this.route,
    this.onTap,
  })  : assert(onTap == null || route == null),
        activation = activeIcon ?? icon;
}

class CustomBottomBarItemWidget extends StatefulWidget {
  CustomBottomBarItemWidget(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.label,
      required this.active,
      this.style = const CustomBottomBarStyle(),
      this.activeIcon}) {}

  final void Function()? onTap;
  final IconData? activeIcon;
  final IconData icon;
  final String label;
  final bool active;
  final CustomBottomBarStyle style;

  @override
  State<CustomBottomBarItemWidget> createState() =>
      _CustomBottomBarItemWidget();
}

class _CustomBottomBarItemWidget extends State<CustomBottomBarItemWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  bool active = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    if (widget.active) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomBottomBarItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.active && widget.active) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        canRequestFocus: false,
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(100), right: Radius.circular(100)),
                child: Stack(alignment: Alignment.center, children: [
                  ScaleTransition(
                      scale: _animation,
                      child: Container(
                          width: double.infinity,
                          color: widget.active
                              ? widget.style.activeColor
                              : Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: const SizedBox(
                            width: 25,
                            height: 25,
                            child: SizedBox(),
                          ))),
                  Positioned(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Icon(
                        widget.active ? widget.activeIcon : widget.icon,
                        color:
                            widget.active ? widget.style.activeIconColor : null,
                        size: 25,
                      ),
                    ),
                  ),
                ]),
              ),
              Text(widget.label,
                  style: TextStyle(
                      fontWeight:
                          widget.active ? FontWeight.w900 : FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar(
      {super.key,
      required this.onItemSelected,
      this.currentIndex = 0,
      this.style = const CustomBottomBarStyle(),
      this.items = const []})
      : assert(items.length >= 2);

  final Function(CustomBottomBarItem) onItemSelected;
  final int currentIndex;
  final CustomBottomBarStyle style;
  final List<CustomBottomBarItem> items;

  @override
  State<StatefulWidget> createState() => _CustomBottomBar();
}

class _CustomBottomBar extends State<CustomBottomBar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: theme.colorScheme.outlineVariant))),
      child: BottomAppBar(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              widget.items.length,
              (index) {
                final item = widget.items[index];
                return CustomBottomBarItemWidget(
                  icon: item.icon,
                  activeIcon: item.activation,
                  label: item.label.tr(),
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                    widget.onItemSelected(widget.items[index]);
                  },
                  active: currentIndex == index,
                  style: widget.style,
                );
              },
            )),
      ),
    );
  }
}
