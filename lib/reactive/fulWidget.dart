import 'package:flutter/material.dart';

import 'index.dart';

typedef BuilderWidget = Widget Function();

abstract class DefineFulWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DefineFulWidget({
    super.key,
  });

  BuilderWidget setup(
    BuildContext context,
  );

  @override
  State<DefineFulWidget> createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<DefineFulWidget> {
  late ReactiveEffect _reactiveEffect;
  late Widget Function() render;

  @override
  void initState() {
    super.initState();
    render = widget.setup(context);
    _reactiveEffect = ReactiveEffect(
        fn: () => render(),
        computed: () {
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return _reactiveEffect.run();
  }
}
