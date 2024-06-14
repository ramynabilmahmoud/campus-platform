import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

class CustomOptionItem<T> {
  final T value;
  final String label;

  const CustomOptionItem({required this.value, required this.label});
}

class CustomOptionPicker<T> extends StatefulWidget {
  const CustomOptionPicker(
      {super.key,
      required this.items,
      this.selectedIndex = 0,
      this.maxItems = 5,
      this.title});

  final List<CustomOptionItem<T>> items;

  final int maxItems;

  final int selectedIndex;

  final String? title;

  @override
  State<CustomOptionPicker<T>> createState() => _CustomOptionPickerState<T>();
}

class _CustomOptionPickerState<T> extends State<CustomOptionPicker<T>> {
  late FixedExtentScrollController _scrollController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    _scrollController =
        FixedExtentScrollController(initialItem: _selectedIndex);
  }

  void _selectAt(int index) {
    setState(() {
      _selectedIndex = index;
      _scrollController.animateToItem(
        _selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      setState(() {
        if (event.scrollDelta.dy > 0) {
          if (_selectedIndex < widget.items.length - 1) {
            _selectedIndex++;
          }
        } else {
          if (_selectedIndex > 0) {
            _selectedIndex--;
          }
        }
        _scrollController.animateToItem(
          _selectedIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: widget.title != null ? Text(widget.title!) : null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 42.0 * widget.maxItems,
              child: Listener(
                  onPointerSignal: _onPointerSignal,
                  child: ListWheelScrollView.useDelegate(
                      itemExtent: 42,
                      controller: _scrollController,
                      diameterRatio: 1.5,
                      perspective: 0.0003,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      childDelegate: ListWheelChildLoopingListDelegate(
                          children: List.generate(
                        widget.items.length,
                        (index) {
                          final selected = index == _selectedIndex;
                          final fontSize = selected ? 24.0 : 16.0;
                          final color =
                              selected ? theme.colorScheme.primary : null;
                          return InkWell(
                            onTap: () {
                              _selectAt(index);
                            },
                            splashFactory: NoSplash.splashFactory,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                color: color,
                                fontSize: fontSize,
                              ),
                              child: Center(
                                  child: Text(widget.items[index].label)),
                            ),
                          );
                        },
                      )))),
            ),
          ],
        ),
      ),
    );
  }
}

void showPicker<T>(BuildContext context, List<CustomOptionItem<T>> items) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CustomOptionPicker<T>(items: items),
      fullscreenDialog: true));
}
