import 'package:flutter/material.dart';

import 'effect.dart';
import 'index.dart';

typedef BuilderWidget = Widget Function();
typedef FulWidget<T> = T Function();

abstract class DefineFulWidget<T> extends StatefulWidget {
  const DefineFulWidget({super.key});

  BuilderWidget setup(BuildContext context, FulWidget<T> widget);

  @override
  State<DefineFulWidget> createState() => _StatefulBuilderState<T>();
}

class _StatefulBuilderState<T> extends State<DefineFulWidget>
    with ReactiveEffectMixin<DefineFulWidget> {
  late Widget Function() render;

  @override
  void initState() {
    super.initState();
    render = widget.setup(context, () => context.widget as T);
    reactiveEffect = ReactiveEffect(
        fn: render,
        computed: () {
          setState(() {});
        });
  }
}
