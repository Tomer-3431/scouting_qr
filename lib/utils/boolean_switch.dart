import 'package:flutter/material.dart';
import 'package:orbit_standard_library/orbit_standard_library.dart';

class BooleanSwitch extends StatefulWidget {
  const BooleanSwitch({
    super.key,
    this.onChange,
  });
  final void Function(bool value)? onChange;

  @override
  State<BooleanSwitch> createState() => _Switch();
}

class _Switch extends State<BooleanSwitch> {
  bool light = true;
  
  static const WidgetStateProperty<Icon> thumbIcon = WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon> {
      WidgetState.selected: Icon(Icons.check),
      WidgetState.any: Icon(Icons.close),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      thumbIcon: thumbIcon,
      onChanged: (bool value) {
        setState(() {
          light = value;
          if (widget.onChange != null) {
            widget.onChange!.call(value);
          }
        });
      },
    );
  }
}