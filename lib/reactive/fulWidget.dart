import 'package:flutter/material.dart';

import 'effect.dart';
import 'index.dart';

typedef BuilderWidget = Widget Function();

abstract class DefineFulWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DefineFulWidget({super.key});

  BuilderWidget setup(
    BuildContext context,
  );

  @override
  State<DefineFulWidget> createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<DefineFulWidget>
    with ReactiveEffectMixin<DefineFulWidget> {
  late Widget Function() render;

  @override
  void initState() {
    super.initState();
    render = widget.setup(context);
    reactiveEffect = ReactiveEffect(
        fn: render,
        computed: () {
          setState(() {});
        });
  }
}
