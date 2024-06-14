import 'package:flutter/material.dart';

class CustomChoiceItem<T> {
  final T value;
  final String label;

  const CustomChoiceItem({required this.value, required this.label});
}

class CustomChoiceWidget<T> extends StatefulWidget {
  const CustomChoiceWidget(
      {super.key,
      required this.label,
      required this.items,
      required this.onChange,
      this.error,
      this.value});

  final T? value;
  final List<CustomChoiceItem<T>> items;
  final String label;
  final String? error;
  final void Function(T? item) onChange;

  @override
  State<CustomChoiceWidget<T>> createState() => _CustomChoiceWidgetState<T>();
}

class _CustomChoiceWidgetState<T> extends State<CustomChoiceWidget<T>> {
  T? _selectedItem;
  CustomChoiceItem? _item;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListChoicesWidget<T>(
                      label: widget.label,
                      items: widget.items,
                      value: _selectedItem,
                      onChange: (item, index) {
                        setState(() {
                          if (index != null) _item = widget.items[index];
                          _selectedItem = item;
                          widget.onChange(item);
                        });
                      },
                    ),
                fullscreenDialog: true));
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label),
                  if (_item != null)
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        Text(_item!.label,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_right_rounded)
            ]),
          ),
        ),
        if (widget.error != null)
          Text(widget.error!,
              style: TextStyle(color: theme.colorScheme.error, fontSize: 12))
      ],
    );
  }
}

class ListChoicesWidget<T> extends StatefulWidget {
  const ListChoicesWidget(
      {super.key,
      required this.label,
      required this.items,
      required this.onChange,
      this.value});

  final List<CustomChoiceItem<T>> items;
  final String label;
  final void Function(T? item, int? index) onChange;
  final T? value;

  @override
  State<ListChoicesWidget<T>> createState() => _ListChoicesWidgetState<T>();
}

class _ListChoicesWidgetState<T> extends State<ListChoicesWidget<T>> {
  T? _groupValue;

  @override
  void initState() {
    super.initState();
    _groupValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          shape: Border(
              bottom: BorderSide(
                  width: 2, color: theme.colorScheme.outlineVariant)),
          title: Text(widget.label,
              style: const TextStyle(fontWeight: FontWeight.w900))),
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          Flexible(
            child: ListView.separated(
              itemBuilder: (context, index) => RadioListTile<T>(
                value: widget.items[index].value,
                title: Text(widget.items[index].label),
                onChanged: (T? value) {
                  setState(() => _groupValue = value);
                  widget.onChange(value, index);
                  Future.delayed(const Duration(milliseconds: 100))
                      .then((_) => Navigator.of(context).pop());
                },
                groupValue: _groupValue,
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: widget.items.length,
            ),
          ),
        ],
      )),
    );
  }
}
